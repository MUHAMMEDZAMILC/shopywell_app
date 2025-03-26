// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/core/globalvariables.dart';
import 'package:shopywell_app/core/helper/help_toast.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/view/presentation/cart/model/cart_model.dart';
import 'package:shopywell_app/view/presentation/landing/view/landingscreen.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';

import '../../../signin/viewmodel/bloc/login_bloc.dart';
import '../../model/address_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(status: CartStatus.loading)) {
    on<CartInitEvent>(cartinit);
    on<CartAddEvent>(addcart);
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {}
  List<CartModel> cartlist = [];
  List<Address> addresslist = [];
  cartinit(CartInitEvent event, Emitter<CartState> emit) async {
    try {
      emit(CartState(status: CartStatus.loading, products: cartlist,addresslist: addresslist));
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection(productcollection).get();
      QuerySnapshot cartsnapshot =
          await FirebaseFirestore.instance
              .collection(cartcollection)
              .where(
                'uid',
                isEqualTo: event.context.read<LoginBloc>().state.userid,
              )
              .get();
      final cartItemsMap = {
        for (var doc in cartsnapshot.docs)
          doc['productid'] as String: {
            'id': doc.id, // cart document ID
            'qty': doc['qty'], // quantity from cart
          },
      };
      log(cartItemsMap.toString());

      cartlist =
          snapshot.docs
              .map((doc) {
                final cartData = cartItemsMap[doc.id];
                log(doc.data().toString());
                return CartModel(
                  product: Products.fromJson(
                    doc.data() as Map<String, dynamic>,
                  ),
                  id: cartData?['id'] as String?, // cart document ID
                  qty: cartData?['qty']?.toDouble(), // quantity from cart
                );
              })
              .where((element) => cartItemsMap.containsKey(element.product?.id))
              .toList();


      QuerySnapshot addresssnapshot =
          await FirebaseFirestore.instance
              .collection(addresscollection)
              .where(
                'uid',
                isEqualTo: event.context.read<LoginBloc>().state.userid,
              )
              .get();
          addresslist = addresssnapshot.docs.map((e) {
            return Address.fromJson(e.data() as Map<String, dynamic>);
          },).toList();
      emit(CartState(status: CartStatus.loaded, products: cartlist,addresslist: addresslist));
    } catch (e) {
      log(e.toString());
      emit(CartState(status: CartStatus.error, products: cartlist,addresslist: addresslist));
    }
  }

  addcart(CartAddEvent event, Emitter<CartState> emit) async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection(cartcollection)
              .where(
                'uid',
                isEqualTo: event.context.read<LoginBloc>().state.userid,
              )
              .where('productid', isEqualTo: event.productid)
              .get();
      if (snapshot.docs.isEmpty) {
        String docid = '${event.productid}${DateTime.now().toString()}';
        await FirebaseFirestore.instance
            .collection(cartcollection)
            .doc(docid)
            .set({
              'id': docid,
              'productid': event.productid,
              'qty': 1,
              'uid': event.context.read<LoginBloc>().state.userid,
            })
            .then((value) {});
        snackBar(
          event.context,
          message: 'Cart Added Check Now',
          type: MessageType.success,
        );

        emit(CartState(status: CartStatus.added));
      } else {
        snackBar(event.context, message: 'Already Added');
        // await FirebaseFirestore.instance
        //     .collection(cartcollection)
        //     .doc(snapshot.docs.first.id)
        //     .delete();
        emit(CartState(status: CartStatus.added));
      }
    } catch (e) {
      log(e.toString());
      emit(CartState(status: CartStatus.added));
    }
  }
}

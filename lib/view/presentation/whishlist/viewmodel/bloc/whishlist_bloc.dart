// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';
import 'package:shopywell_app/view/presentation/signin/viewmodel/bloc/login_bloc.dart';

import '../../../../../core/globalvariables.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  WhishlistBloc()
    : super(WhishlistState(status: WhishListStatus.loading, products: [])) {
    on<WhishListInitEvent>(initwhislist);
    on<WhishListAddProductEvent>(addorremovewhish);
  }

  Stream<WhishlistState> mapEventToState(WhishlistEvent event) async* {
  }
  List<Products> products = [];
  initwhislist(WhishListInitEvent event, Emitter<WhishlistState> emit) async {
    try {
      emit(WhishlistState(status: WhishListStatus.loading, products: products));
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection(productcollection).get();
      QuerySnapshot whishsnapshot =
          await FirebaseFirestore.instance
              .collection(whishlistcollection)
              .where(
                'uid',
                isEqualTo: event.context.read<LoginBloc>().state.userid,
              )
              .get();
      final listedproductids =
          whishsnapshot.docs.map((doc) => doc['productid'] as String).toSet();
      log(listedproductids.toString());

      products =
          snapshot.docs
              .map((doc) {
                log(doc.data().toString());
                return Products.fromJson(doc.data() as Map<String, dynamic>);
              })
              .where((element) => listedproductids.contains(element.id))
              .toList();
      emit(WhishlistState(status: WhishListStatus.loaded, products: products));
    } catch (e) {
      log(e.toString());
      emit(WhishlistState(status: WhishListStatus.error, products: products));
    }
  }

  addorremovewhish(
    WhishListAddProductEvent event,
    Emitter<WhishlistState> emit,
  ) async {
    try {
       emit(WhishlistState(status: WhishListStatus.add, products: products));
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection(whishlistcollection)
              .where(
                'uid',
                isEqualTo: event.context.read<LoginBloc>().state.userid,
              )
              .where('productid', isEqualTo: event.productid)
              .get();
      if (snapshot.docs.isEmpty) {
        String docid = '${event.productid}${DateTime.now().toString()}';
        await FirebaseFirestore.instance
            .collection(whishlistcollection)
            .doc(docid)
            .set({
              'id': docid,
              'productid': event.productid,
              'uid': event.context.read<LoginBloc>().state.userid,
            })
            .then((value) {
              
            });
       emit(WhishlistState(status: WhishListStatus.addsuccess, products: products));
      } else {
        await FirebaseFirestore.instance
            .collection(whishlistcollection)
            .doc(snapshot.docs.first.id)
            .delete();
            emit(WhishlistState(status: WhishListStatus.addsuccess, products: products));
      }
    } catch (e) {
      log(e.toString());
      emit(WhishlistState(status: WhishListStatus.addsuccess, products: products));
    }
  }
}

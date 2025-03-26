// ignore_for_file: override_on_non_overriding_member, use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/core/globalvariables.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';
import 'package:shopywell_app/view/presentation/signin/viewmodel/bloc/login_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(status: HomeStatus.lodaing, pproducts: [])) {
    on<HomeInitEvent>(homeinit);
    on<HomegetproductEvent>(getproduct);
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {}
  List<Products> products = [];
  homeinit(HomeInitEvent event, Emitter<HomeState> emit) async {
    try {
      emit(HomeState(status: HomeStatus.lodaing, pproducts: products));
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
      final listedproduuctid =
          whishsnapshot.docs.map((doc) => doc['productid']).toSet();
      log(listedproduuctid.toString());
      products =
          snapshot.docs.map((doc) {
            final product = Products.fromJson(
              doc.data() as Map<String, dynamic>,
            );
            product.whish = listedproduuctid.contains(product.id) ? 1 : 0;
            return product;
          }).toList();
      emit(HomeState(status: HomeStatus.loaded, pproducts: products));
    } catch (e) {
      log(e.toString());
      emit(HomeState(status: HomeStatus.error, pproducts: products));
    }
  }

  getproduct(HomegetproductEvent event, Emitter<HomeState> emit) async {
    try {
      // emit(HomeState(status: HomeStatus.lodaing, pproducts: products));
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
      final listedproduuctid =
          whishsnapshot.docs.map((doc) => doc['productid']).toSet();
      log(listedproduuctid.toString());
      products =
          snapshot.docs.map((doc) {
            final product = Products.fromJson(
              doc.data() as Map<String, dynamic>,
            );
            product.whish = listedproduuctid.contains(product.id) ? 1 : 0;
            return product;
          }).toList();
      emit(HomeState(status: HomeStatus.loaded, pproducts: products));
    } catch (e) {
      log(e.toString());
      emit(HomeState(status: HomeStatus.error, pproducts: products));
    }
  }
}

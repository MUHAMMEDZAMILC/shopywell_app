// ignore_for_file: override_on_non_overriding_member

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:shopywell_app/core/globalvariables.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(status: HomeStatus.lodaing,pproducts: [])){
    on<HomeInitEvent>(homeinit);
    on<HomeaddWhislistEvent>(addremovewhish);
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {

  }
  List<Products> products=[];
   homeinit(HomeInitEvent event, Emitter<HomeState> emit) async{
    try {
      emit(HomeState(status: HomeStatus.lodaing, pproducts: products));
     QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection(productcollection).get();
     products = snapshot.docs.map((doc) {
        return Products.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      emit(HomeState(status: HomeStatus.loaded, pproducts: products));
    } catch (e) {
      log(e.toString());
      emit(HomeState(status: HomeStatus.error, pproducts: products));
    }
  }

  



   addremovewhish(HomeaddWhislistEvent event, Emitter<HomeState> emit) async {
    try {
      int sta = event.product.whish==0?1:0;
      await FirebaseFirestore.instance.collection(productcollection).doc(event.product.id).update({
        'whish':sta
      });
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection(productcollection).get();
     products = snapshot.docs.map((doc) {
        return Products.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      products.shuffle();
      emit(HomeState(status: HomeStatus.loaded, pproducts: products));
    } catch (e) {
      log("failed add whishlist $e");
    }
  }
}

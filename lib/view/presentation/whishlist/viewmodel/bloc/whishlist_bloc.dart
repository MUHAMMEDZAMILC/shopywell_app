import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';

import '../../../../../core/globalvariables.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  WhishlistBloc() : super(WhishlistState(status: WhishListStatus.loading,products: [])){
    on<WhishListInitEvent>(initwhislist);
  }

  @override
  Stream<WhishlistState> mapEventToState(
    WhishlistEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
  List<Products> products=[];
  initwhislist(WhishListInitEvent event, Emitter<WhishlistState> emit) async{
    try {
      emit(WhishlistState(status: WhishListStatus.loading, products: products));
     QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection(productcollection).where('whish',isEqualTo: 1).get();
             
     products = snapshot.docs.map((doc) {
       log(doc.data().toString());
        return Products.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
      emit(WhishlistState(status: WhishListStatus.loaded, products: products));
    } catch (e) {
      log(e.toString());
      emit(WhishlistState(status: WhishListStatus.error, products: products));
    }
  }
}

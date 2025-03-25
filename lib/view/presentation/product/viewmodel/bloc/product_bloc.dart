import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';

import '../../../../../core/globalvariables.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState(status: ProductStatus.loading)) {
    on<ProductDetailinitEvent>(productload);
  }

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    // TODO: implement mapEventToState
  }
  Products? product;
  List<Products>? similarproduct = [];
  productload(ProductDetailinitEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductState(status: ProductStatus.loading));
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection(productcollection)
              .where('id', isEqualTo: event.productid)
              .limit(1)
              .get();
      product =
          snapshot.docs
              .map((doc) {
                return Products.fromJson(doc.data() as Map<String, dynamic>);
              })
              .toList()
              .first;
      QuerySnapshot similarsnapshot =
          await FirebaseFirestore.instance
              .collection(productcollection)
              .where('category', isEqualTo: product?.category)
              .get();
      similarproduct =
          similarsnapshot.docs.map((doc) {
            return Products.fromJson(doc.data() as Map<String, dynamic>);
          }).toList();
      emit(ProductState(status: ProductStatus.loaded, product: product,similarproduct: similarproduct));
    } catch (e) {
      emit(ProductState(status: ProductStatus.error, product: product,similarproduct: similarproduct));
    }
  }
}

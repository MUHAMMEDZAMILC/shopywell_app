part of 'product_bloc.dart';

enum ProductStatus {initial,loading,loaded,error}
class ProductState extends Equatable {
  ProductStatus status;
  Products? product;
  List<Products>? similarproduct;
  
   ProductState({required this.status, this.product,this.similarproduct});
  
  @override
  List<Object?> get props => [status,product];
}


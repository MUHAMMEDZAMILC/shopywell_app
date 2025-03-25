part of 'product_bloc.dart';

enum ProductStatus {initial,loading,loaded,error}
class ProductState extends Equatable {
  ProductStatus status;
  Products? product;
  
   ProductState({required this.status, this.product});
  
  @override
  List<Object?> get props => [status,product];
}


part of 'cart_bloc.dart';

enum CartStatus { initial, loading, loaded, error, adding, added }

class CartState extends Equatable {
  CartStatus status;
  List<CartModel>? products;
  List<Address>? addresslist; 
  CartState({required this.status,this.products,this.addresslist});

  @override
  List<Object?> get props => [status,products,addresslist];
}


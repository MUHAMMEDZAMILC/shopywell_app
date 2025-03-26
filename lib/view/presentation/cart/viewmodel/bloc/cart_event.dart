part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitEvent extends CartEvent {
  BuildContext context;
  CartInitEvent(this.context);
}

class CartAddEvent extends CartEvent {
  final BuildContext context;
  final String productid;
  final double qty;
  CartAddEvent(this.context,this.productid,this.qty);
}
part of 'whishlist_bloc.dart';

abstract class WhishlistEvent extends Equatable {
  const WhishlistEvent();

  @override
  List<Object> get props => [];
}

class WhishListInitEvent extends WhishlistEvent{
  BuildContext context;
  WhishListInitEvent({required this.context});
}

class WhishListAddProductEvent extends WhishlistEvent {
  BuildContext context;
  String productid;
  WhishListAddProductEvent({required this.context, required this.productid});
}
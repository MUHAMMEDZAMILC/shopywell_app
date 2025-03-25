part of 'whishlist_bloc.dart';

abstract class WhishlistEvent extends Equatable {
  const WhishlistEvent();

  @override
  List<Object> get props => [];
}

class WhishListInitEvent extends WhishlistEvent{}
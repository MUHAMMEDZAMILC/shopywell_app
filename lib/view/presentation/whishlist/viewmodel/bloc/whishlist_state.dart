part of 'whishlist_bloc.dart';

enum WhishListStatus {initial,loading,loaded,error}
 class WhishlistState extends Equatable {
  final WhishListStatus status;
  final List<Products> products;
  const WhishlistState({required this.status,required this.products});
  
  @override
  List<Object> get props => [status,products];
}



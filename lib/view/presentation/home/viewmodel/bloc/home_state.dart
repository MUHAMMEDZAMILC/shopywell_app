part of 'home_bloc.dart';

enum HomeStatus {initial,lodaing,loaded,error}
 class HomeState extends Equatable {
  final HomeStatus status;
  final List<Products> pproducts;
  const HomeState({required this.status,required this.pproducts});
  
  @override
  List<Object> get props => [status,pproducts];
}


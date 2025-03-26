// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitEvent extends HomeEvent {
  BuildContext context;
  HomeInitEvent(this.context);
}

class HomegetproductEvent extends HomeEvent {
   BuildContext context;
  HomegetproductEvent(this.context);
}
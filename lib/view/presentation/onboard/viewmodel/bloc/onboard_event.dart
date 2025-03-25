part of 'onboard_bloc.dart';

abstract class OnboardEvent extends Equatable {
  const OnboardEvent();

  @override
  List<Object> get props => [];
}

class OnboardInitEvent extends OnboardEvent {
  final BuildContext context;
  const OnboardInitEvent(this.context);
}

class OnboardPageChangeEvent extends OnboardEvent {
  final int page;
  final BuildContext context;
  const OnboardPageChangeEvent(this.page,this.context);
}

class OnboardskipEvent extends OnboardEvent{
  final BuildContext context;
  const  OnboardskipEvent(this.context); 
}

class OnboardnextEvent extends OnboardEvent {
  final BuildContext context;
  final PageController controller;
  const OnboardnextEvent(this.context,this.controller);
}

class CheckonboardEvent extends OnboardEvent {
  
}

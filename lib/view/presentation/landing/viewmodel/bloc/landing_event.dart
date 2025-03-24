part of 'landing_bloc.dart';

abstract class LandingEvent extends Equatable {
  const LandingEvent();

  @override
  List<Object> get props => [];
}

class LandingInitialEvent extends LandingEvent {
  final int currentIndex;
   const LandingInitialEvent(this.currentIndex);
}

class ChangeIndexEvent extends LandingEvent {
  final int currentIndex;
  const ChangeIndexEvent(this.currentIndex);
  
}

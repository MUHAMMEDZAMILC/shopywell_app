part of 'landing_bloc.dart';

enum LandingStatus { initial, loading, loaded, error }

class LandingState extends Equatable {
  final int currentIndex;
  final List pages;
  final LandingStatus status;
  const LandingState({required this.status,required this.currentIndex,required this.pages });

  @override
  List<Object> get props => [currentIndex,pages];
}

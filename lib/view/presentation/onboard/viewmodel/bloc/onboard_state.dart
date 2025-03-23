part of 'onboard_bloc.dart';

enum OnboardStatus { initial, changedpage, skip, next }

class OnboardState extends Equatable {
  final OnboardStatus status;
  final List<Map<String, String>> onboardingData;
  final int currentindex;

  const OnboardState({
    required this.status,
    required this.onboardingData,
    required this.currentindex,
  });

  @override
  List<Object> get props => [status, onboardingData, currentindex];
}
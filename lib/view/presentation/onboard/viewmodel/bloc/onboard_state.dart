part of 'onboard_bloc.dart';

enum OnboardStatus { initial, success, changedpage, skip, next }

class OnboardState extends Equatable {
  final OnboardStatus status;
  final List<Map<String, String>> onboardingData;
  final int currentindex;
  final bool ischecked;

  const OnboardState({
    this.ischecked = false,
    required this.status,
    required this.onboardingData,
    required this.currentindex,
  });

  @override
  List<Object> get props => [status, onboardingData, currentindex];
}

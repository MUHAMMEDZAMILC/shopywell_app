// ignore_for_file: must_be_immutable

part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class SplashInitialEvent extends SplashEvent {
  final BuildContext context;
  SplashInitialEvent(this.context);
 
}

part of 'firebase_bloc.dart';

abstract class FirebaseState extends Equatable {
  const FirebaseState();

  @override
  List<Object> get props => [];
}

class FirebaseInitial extends FirebaseState {}

class Fireseloaded extends FirebaseState {}

class FirebaseError extends FirebaseState {}

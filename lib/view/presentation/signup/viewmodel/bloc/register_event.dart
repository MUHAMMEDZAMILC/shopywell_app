part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent{
  final BuildContext context;
  final UserData data;
  const RegisterUserEvent(this.context,this.data);
}
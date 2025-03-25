part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class CheckalreadyloginEvent extends LoginEvent {
  
}

class LoginuserEvent extends LoginEvent {
  final BuildContext context;
  final UserData data;
  const LoginuserEvent(this.context,this.data,);
}
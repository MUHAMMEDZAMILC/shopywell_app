part of 'login_bloc.dart';

enum LoginStatus { initial, loding, success, error }

 class LoginState extends Equatable {
  final LoginStatus? status;
  final bool islogin;
  final String? userid;
  final String? msg; 
   const LoginState({this.status, this.islogin = false,this.userid,this.msg});

  @override
  List<Object?> get props => [status,msg];
}


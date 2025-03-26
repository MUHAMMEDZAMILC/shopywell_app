// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

enum RegisterStatus {initiize,loading,success,error}
 class RegisterState extends Equatable {
  RegisterStatus? status;
  BuildContext? context;
  String? mesg;
   RegisterState({this.status,this.context,this.mesg});
  
  @override
  List<Object?> get props => [status, context, mesg];
}



part of 'payment_bloc.dart';

enum PaymentStatus {initial,loading,loaded,error,paymenting,paymentsuccess,paymentfailed}
 class PaymentState extends Equatable {
  PaymentStatus status;
  String? message;
  PaymentState({required this.status,this.message});
  
  @override
  List<Object?> get props => [status,message];
}


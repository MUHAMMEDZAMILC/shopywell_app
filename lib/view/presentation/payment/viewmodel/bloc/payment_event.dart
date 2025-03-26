part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class RazorPayEvent extends PaymentEvent {
  BuildContext context;
  double payamount;
  String? productname,describtion;
  RazorPayEvent(this.context,this.payamount,this.describtion,this.productname);
}

class PaymentInitEvent extends PaymentEvent {
  BuildContext context;
  PaymentInitEvent(this.context);
}
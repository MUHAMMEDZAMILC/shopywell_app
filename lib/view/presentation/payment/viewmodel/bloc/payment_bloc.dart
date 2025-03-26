import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopywell_app/view/presentation/profile/viewmodel/bloc/profile_bloc.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../../core/helper/help_toast.dart';
import '../../../../../core/utils/theme/colors.dart';
import '../../../../../core/utils/theme/dimensions.dart';
import '../../../../components/appsvg.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentState(status: PaymentStatus.initial)) {
    on<PaymentInitEvent>(paymentinit);
    on<RazorPayEvent>(razorpaymethod);
  }

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {}
  Razorpay? _razorpay;
  razorpaymethod(RazorPayEvent event, Emitter<PaymentState> emit) async {
    try {
      emit(PaymentState(status: PaymentStatus.paymenting));
      var options = {
        'key': 'rzp_live_6NEMkMwtWOVXWs',
        'amount': event.payamount * 100,
        'name': event.productname,
        'description': event.describtion,
        'prefill': {
          'email': event.context.read<ProfileBloc>().state.userdata?.email,
        },
        'method': {'upi': true},
        'upi': {'flow': 'intent'},
      };
      _razorpay?.open(options);
      emit(PaymentState(status: PaymentStatus.paymentsuccess));
    } catch (e) {
      emit(PaymentState(status: PaymentStatus.paymentfailed));
    }
  }

  handlePaymentSuccess(BuildContext context, PaymentSuccessResponse? res) {
    snackBar(context, message: 'payment Sucess', type: MessageType.success);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorResources.TRANSPARENT,
          contentPadding: EdgeInsets.zero,
          content: Stack(
            children: [
              AppSvg(assetName: paymentsuccpop),
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      boxShadow: ColorResources.defshadow,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: Icon(
                        CupertinoIcons.clear,
                        color: ColorResources.BTNRED,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void handlePaymentError(BuildContext context, PaymentFailureResponse re) {
    print("Error");
    snackBar(context, message: "Error payment ${re.message}");
  }

  paymentinit(PaymentInitEvent event, Emitter<PaymentState> emit) {
    _razorpay = Razorpay();
    _razorpay?.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
      (response) => handlePaymentSuccess(event.context, response),
    );
    _razorpay?.on(
      Razorpay.EVENT_PAYMENT_ERROR,
      (response) => handlePaymentError(event.context, response),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/extension/upperfstring_ext.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appbutton.dart';
import 'package:shopywell_app/view/components/appsvg.dart';
import 'package:shopywell_app/view/presentation/cart/model/cart_model.dart';
import 'package:shopywell_app/view/presentation/payment/viewmodel/bloc/payment_bloc.dart';
import 'package:shopywell_app/view/presentation/profile/viewmodel/bloc/profile_bloc.dart';

import '../../../../core/constants/strings.dart';
import '../../../components/apptext.dart';

class PaymentScreen extends StatefulWidget {
   PaymentScreen({super.key,required this.paymentdata});
  CartModel paymentdata;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileInitEvent(context));
    context.read<PaymentBloc>().add(PaymentInitEvent(context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApBarMn(titlename: 'Payment', titleonly: true, isback: true),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Padding(
          padding: const EdgeInsets.all(paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Order',
                    size: 18,
                    weight: FontWeight.w400,
                    color: ColorResources.TEXTCOLORSUB,
                  ),
                  AppText(
                    text: '$rupesssymbol ${( widget.paymentdata.product!.price!.toDouble())*(widget.paymentdata.qty!.toDouble())}',
                    size: 18,
                    weight: FontWeight.w400,
                    color: ColorResources.TEXTCOLORSUB,
                  ),
                ],
              ),
              gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Shipping fee',
                    size: 18,
                    weight: FontWeight.w400,
                    color: ColorResources.TEXTCOLORSUB,
                  ),
                  AppText(
                    text: '$rupesssymbol 0.0',
                    size: 18,
                    weight: FontWeight.w400,
                    color: ColorResources.TEXTCOLORSUB,
                  ),
                ],
              ),
              gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: 'Total', size: 18, weight: FontWeight.w400),
                  AppText(
                    text:'$rupesssymbol ${( widget.paymentdata.product!.price!.toDouble())*(widget.paymentdata.qty!.toDouble())}',
                    size: 18,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              Divider(color: ColorResources.HINTTEXT, thickness: 2),
              gapLarge,
              AppText(
                text: 'Payment Method',
                size: 18,
                weight: FontWeight.w500,
              ),
              gapLarge,
              Container(
                height: 50,
                width: ScreenUtil.screenWidth,
                decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: ColorResources.HINTTEXT, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 'razorPay'.upperFull,
                        size: 14,
                        weight: FontWeight.w600,
                        color: ColorResources.CONTAINERBLUE,
                      ),
                      AppText(
                        text: '717836****',
                        size: 14,
                        weight: FontWeight.w600,
                        color: ColorResources.TEXTCOLORSUB,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              ApBtn(
                onPressed: () {
                  context.read<PaymentBloc>().add(RazorPayEvent(context, ( widget.paymentdata.product!.price!.toDouble())*(widget.paymentdata.qty!.toDouble()), widget.paymentdata.product?.description, widget.paymentdata.product?.title));
                 
                },
                isValid: true,
                child: AppText(text: 'Continue', color: ColorResources.WHITE),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

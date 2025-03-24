import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/extension/upperfstring_ext.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appbutton.dart';
import 'package:shopywell_app/view/components/appsvg.dart';

import '../../../../core/constants/strings.dart';
import '../../../components/apptext.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
                    text: '$rupesssymbol 6368',
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
                    text: '$rupesssymbol 6368',
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
                    text: '$rupesssymbol 6368',
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
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      backgroundColor: ColorResources.TRANSPARENT,
                      contentPadding: EdgeInsets.zero,
                      content: Stack(
                        children: [
                          AppSvg(assetName: paymentsuccpop),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                               decoration: BoxDecoration(
                                 color: ColorResources.WHITE,
                                 boxShadow: ColorResources.defshadow,
                              shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(padding),
                                  child: Icon(CupertinoIcons.clear, color: ColorResources.BTNRED,size: 18,),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },);
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

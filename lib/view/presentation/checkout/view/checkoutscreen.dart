import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appbutton.dart';
import 'package:shopywell_app/view/components/apprichtext.dart';
import 'package:shopywell_app/view/components/appsvg.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/utils/theme/colors.dart';
import '../../../components/apptext.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApBarMn(titlename: 'Checkout', titleonly: true, isback: true),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Padding(
          padding: const EdgeInsets.all(paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 125,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://www.figma.com/file/H63EWkcBYgItXxpB5542Cy/image/8078cca87e2902aed324a7079170bc593f670a51',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  gapHorizontal,
                  Expanded(
                    child: SizedBox(
                      height: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: 'Women’s Casual Wear',
                            size: 14,
                            maxline: 2,
                            weight: FontWeight.w600,
                          ),

                          AppText(
                            text: 'Checked Single-Breasted Blazer',
                            size: 12,
                            maxline: 2,
                          ),

                          // gapSmall,
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: ColorResources.HINTTEXT,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: padding,
                                    vertical: paddingSmall,
                                  ),
                                  child: Row(
                                    children: [
                                      AppText(
                                        text: 'Size : 42',
                                        size: 10,
                                        color: ColorResources.BLACK,
                                      ),
                                      gapHorizontalSmall,
                                      Icon(
                                        CupertinoIcons.chevron_down,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              gapHorizontalSmall,
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: ColorResources.HINTTEXT,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: padding,
                                    vertical: paddingSmall,
                                  ),
                                  child: Row(
                                    children: [
                                      AppText(
                                        text: 'Qty : 1',
                                        size: 10,
                                        color: ColorResources.BLACK,
                                      ),
                                      gapHorizontalSmall,
                                      Icon(
                                        CupertinoIcons.chevron_down,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // gapSmall,
                          AppRichText(
                            normalText: 'Delivery by ',
                            richText: '10 May 2XXX',
                            fontSize: 12,
                            richFontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              gapLarge,
              Row(
                children: [
                  AppSvg(assetName: coupon),
                  gapHorizontal,
                  AppText(
                    text: 'Apply Coupons',
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                  Spacer(),
                  AppText(
                    text: 'Select',
                    size: 14,
                    color: ColorResources.PRIMARYCOLOR,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              gapLarge,
              Divider(color: ColorResources.HINTTEXT, thickness: 2),
              gapLarge,
              AppText(text: 'Order Payment Details',size: 17,weight: FontWeight.w500,),
              gapLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: 'Order Amounts',size: 16, weight: FontWeight.w400,),
                  AppText(text: '$rupesssymbol 6368',size: 16, weight: FontWeight.w600,), 
                ],
              ),
              gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppRichText(normalText: 'Convience',richText: '  Know More',fontSize: 16, normalFontWeight: FontWeight.w400,richFontWeight: FontWeight.w500,richTextFontSize: 12,richTextColor: ColorResources.PRIMARYCOLOR,),
                  AppText(text: 'Apply Coupon',size: 12, weight: FontWeight.w500,color: ColorResources.PRIMARYCOLOR,), 
                ],
              ),
              gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: 'Delivery Fee',size: 16, weight: FontWeight.w400,),
                  AppText(text: 'Free',size: 12, weight: FontWeight.w500,color: ColorResources.PRIMARYCOLOR,), 
                ],
              ),
              gapLarge,
               Divider(color: ColorResources.HINTTEXT, thickness: 2),
              gapLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(text: 'Order Total',size: 16, weight: FontWeight.w400,),
                  AppText(text: '$rupesssymbol 6368',size: 16, weight: FontWeight.w600,), 
                ],
              ),gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppRichText(normalText: 'EMI Available',richText: '  Details',fontSize: 16, normalFontWeight: FontWeight.w400,richFontWeight: FontWeight.w500,richTextFontSize: 12,richTextColor: ColorResources.PRIMARYCOLOR,),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: ColorResources.WHITE,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: '$rupesssymbol 6368',size: 16, weight: FontWeight.w600,),
                    AppText(text: 'View Details',size: 12, weight: FontWeight.w600,color: ColorResources.PRIMARYCOLOR,),
                  ],
                ),
              ),
              Expanded(
                child: ApBtn(
                  height: 40,
                  onPressed: () {
                  
                }, isValid: true,child: AppText(text: 'Proceed to Payment',color: ColorResources.WHITE,),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

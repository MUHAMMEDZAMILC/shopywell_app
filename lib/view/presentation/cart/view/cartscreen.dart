import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/presentation/checkout/view/checkoutscreen.dart';

import '../../../../core/helper/help_screensize.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      child: Padding(
        padding: const EdgeInsets.all(paddingLarge),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: ColorResources.BLACK,
                    size: 18,
                  ),
                  gapHorizontal,
                  AppText(
                    text: 'Delivery Address',
                    size: 14,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              gapLarge,
              SizedBox(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(padding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: 'Address : ',
                                    size: 12,
                                    weight: FontWeight.w400,
                                  ),
                                  Icon(
                                    CupertinoIcons.pencil_ellipsis_rectangle,
                                    color: ColorResources.BLACK,
                                  ),
                                ],
                              ),
                              AppText(
                                text:
                                    "216 St Paul's Rd, London N1 2LL, UK Contact :  +44-784232",
                                textalign: TextAlign.start,
                                maxline: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    gapHorizontal,
                    Expanded(
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(CupertinoIcons.add_circled, size: 40),
                      ),
                    ),
                  ],
                ),
              ),
              gapLarge,
              AppText(text: 'Shopping List', size: 14, weight: FontWeight.w600),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: paddingSmall),
                    child: GestureDetector(
                      onTap: () {
                        Screen.open(context, CheckoutScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(paddingLarge),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 125,
                                    height: 125,
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
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: 'Women’s Casual Wear',
                                          size: 14,
                                          maxline: 2,
                                          weight: FontWeight.w600,
                                        ),
                                        gapSmall,
                                        Row(
                                          children: [
                                            AppText(
                                              text: 'Varients : ',
                                              size: 12,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                  color: ColorResources.HINTTEXT,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: padding,
                                                      vertical: paddingSmall,
                                                    ),
                                                child: AppText(
                                                  text: 'Black',
                                                  size: 10,
                                                  color: ColorResources.BLACK,
                                                ),
                                              ),
                                            ),
                                            gapHorizontalSmall,
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                  color: ColorResources.HINTTEXT,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: padding,
                                                      vertical: paddingSmall,
                                                    ),
                                                child: AppText(
                                                  text: 'White',
                                                  size: 10,
                                                  color: ColorResources.BLACK,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        gapSmall,
                                        Row(
                                          children: [
                                            AppText(text: '4.8', size: 12),
                                            gapHorizontal,
                                            RatingBar.builder(
                                              itemSize: 12,
                                              initialRating: 3.5,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ignoreGestures: true,
                                              itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1.0,
                                              ),
                                              itemBuilder:
                                                  (context, _) => Icon(
                                                    Icons.star,
                                                    size: 12,
                                                    color:
                                                        ColorResources.STARCOLOR,
                                                  ),
                                              tapOnlyMode: false,
                                              unratedColor:
                                                  ColorResources.HINTTEXT,
                                              onRatingUpdate: (rating) {},
                                            ),
                                          ],
                                        ),
                                        gapSmall,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                  color: ColorResources.HINTTEXT,
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: padding,
                                                      vertical: paddingSmall,
                                                    ),
                                                child: AppText(
                                                  text: '$rupesssymbol 1233',
                                                  size: 16,
                                                  weight: FontWeight.w600,
                                                  color: ColorResources.BLACK,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                AppText(
                                                  text: 'upto 33% off',
                                                  weight: FontWeight.w500,
                                                  size: 8,
                                                  color: ColorResources.AMTRED,
                                                ),
                                                AppText(
                                                  text: '$rupesssymbol 64.00',
                                                 size: 12,
                                                  color: ColorResources.HINTTEXT,
                                                  deccolor: ColorResources.HINTTEXTDARK,
                                                  decoration: TextDecoration.lineThrough,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: ColorResources.HINTTEXT,
                                thickness: 2,
                              ),
                      
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    text: 'Total Order : 2',
                                    size: 12,
                                    weight: FontWeight.w500,
                                  ),
                                  AppText(
                                    text: '$rupesssymbol 2466',
                                    size: 12,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/help_loader.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/presentation/cart/model/address_model.dart';
import 'package:shopywell_app/view/presentation/cart/model/cart_model.dart';
import 'package:shopywell_app/view/presentation/cart/viewmodel/bloc/cart_bloc.dart';
import 'package:shopywell_app/view/presentation/checkout/view/checkoutscreen.dart';

import '../../../../core/helper/help_screensize.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartBloc>().add(CartInitEvent(context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc,CartState>(
      builder: (context,state) {
        if (state.status == CartStatus.loading) {
          return PageEntryLoader();
        }
        if (state.status == CartStatus.error) {
          return CustomError(
            height: ScreenUtil.screenHeight,
            errortext: 'Something Wrong!',
          );
        }
        if (state.status == CartStatus.loaded && state.products!.isEmpty) {
          return CustomNotFound(
            height: ScreenUtil.screenHeight,
          );
        }
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
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.addresslist?.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index) {
                      Address addresdata = state.addresslist![index];
                      return SizedBox(
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
                                            "${addresdata.address??''} ${addresdata.phone??''}",
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
                      );
                    }
                  ),
                  gapLarge,
                  AppText(text: 'Shopping List', size: 14, weight: FontWeight.w600),
                  ListView.builder(
                    itemCount: state.products?.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      CartModel data = state.products![index];
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
                                              data.product?.image??'',
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
                                              text: data.product?.title??'',
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
                                                AppText(text:data.product?.rating?.rate.toString()?? '0.0', size: 12),
                                                gapHorizontal,
                                                RatingBar.builder(
                                                  itemSize: 12,
                                                  initialRating: data.product?.rating?.rate??0.0,
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
                                                      text: '$rupesssymbol ${data.product?.price}',
                                                      size: 16,
                                                      weight: FontWeight.w600,
                                                      color: ColorResources.BLACK,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    AppText(
                                                      text: 'upto ${data.product?.off}% off',
                                                      weight: FontWeight.w500,
                                                      size: 8,
                                                      color: ColorResources.AMTRED,
                                                    ),
                                                    AppText(
                                                      text: '$rupesssymbol ${data.product?.mrp}',
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
                                        text: 'Total Order : ${data.qty}',
                                        size: 12,
                                        weight: FontWeight.w500,
                                      ),
                                      AppText(
                                        text: '$rupesssymbol ${( data.product!.price!.toDouble())*(data.qty!.toDouble())}',
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
    );
  }
}

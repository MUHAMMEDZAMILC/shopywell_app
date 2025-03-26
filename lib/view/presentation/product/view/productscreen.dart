// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/help_loader.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appsvg.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/presentation/cart/viewmodel/bloc/cart_bloc.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';
import 'package:shopywell_app/view/presentation/product/view/widgets/circleindicator.dart';
import 'package:shopywell_app/view/presentation/product/viewmodel/bloc/product_bloc.dart';


class ProductScreen extends StatefulWidget {
   ProductScreen({super.key,required this.productid});
  String productid;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentIndex = 0; // Track the current index
  final PageController pageController = PageController();
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductDetailinitEvent(widget.productid));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApBarMn(titlename: 'Product', isback: true, titleonly: true),
      body: BlocBuilder<ProductBloc,ProductState>(
        builder: (context,state) {
          if (state.status == ProductStatus.loading) {
            return PageEntryLoader();
          }
          if (state.status == ProductStatus.error) {
            return CustomError(height: ScreenUtil.screenHeight,);
          }
          return SizedBox(
            width: ScreenUtil.screenWidth,
            height: ScreenUtil.screenHeight,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapLarge,
                  SizedBox(
                    width: ScreenUtil.screenWidth,
                    height: 235,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView(
                            controller: pageController,
                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            children: state.product!.gallery!.map((e) => Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: paddingLarge,
                                ),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: ScreenUtil.screenWidth! * 0.9,
                                  height: 220,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      paddingLarge,
                                    ),
                                  ),
                                  child: Image.network(
                                    e,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),).toList(),
                          ),
                        ),
                        // Dotted Indicator
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            2, // Number of items in the PageView
                            (index) =>
                                CircledotIndicator(isActive: index == currentIndex),
                          ),
                        ),
                      ],
                    ),
                  ),
                  gapLarge,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                    child: AppText(
                      text: 'Size: 7UK',
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                  ),
                  gap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                    child: SizedBox(
                      height: 35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: padding),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: ColorResources.SIZECHARTRED,
                                  width: 1.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Center(
                                  child: AppText(
                                    text: '7UK',
                                    size: 14,
                                    weight: FontWeight.w600,
                                    color: ColorResources.SIZECHARTRED,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  gapLarge,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: state.product?.title??'',
                          size: 20,
                          weight: FontWeight.w600,
                        ),
                        AppText(
                          text:state.product?.category??'' ,
                          size: 14,
                          weight: FontWeight.w400,
                          maxline: 2,
                        ),
                        gap,
                        Row(
                          children: [
                            RatingBar.builder(
                              itemSize: 18,
                              initialRating: state.product?.rating?.rate??0.0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ignoreGestures: true,
                              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder:
                                  (context, _) => Icon(
                                    Icons.star,
                                    size: 12,
                                    color: ColorResources.STARCOLOR,
                                  ),
                              tapOnlyMode: false,
                              unratedColor: ColorResources.HINTTEXT,
                              onRatingUpdate: (rating) {},
                            ),
                            gapHorizontal,
                            AppText(
                              text: state.product?.rating?.count.toString()?? '',
                              color: ColorResources.HINTTEXT,
                              size: 14,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                        AppText(
                          text:
                              state.product?.description??'',
                          size: 12,
                          weight: FontWeight.w400,
                          maxline: 4,
                        ),
                        gapLarge,
                        SizedBox(
                          height: 28,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: padding),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: ColorResources.HINTTEXTDARK,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: ColorResources.HINTTEXTDARK,
                                          size: 16,
                                        ),
                                        gapHorizontalSmall,
                                        AppText(
                                          text: 'Nearst Store',
                                          size: 10,
                                          weight: FontWeight.w500,
                                          color: ColorResources.HINTTEXTDARK,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        gapLarge,
                        Row(
                          children: [
                            AppSvg(assetName: gotocart,onPressed: () {
                              context.read<CartBloc>().add(CartAddEvent(context, widget.productid, 1));
                            },),
                            12.wBox,
                            AppSvg(assetName: buynow),
                          ],
                        ),
                        gapLarge,
                        Container(
                          width: ScreenUtil.screenWidth,
                          decoration: BoxDecoration(
                            color: ColorResources.CONTAINERLIGHTRED.withOpacity(
                              0.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: 'Delivery in  ',
                                      color: ColorResources.BLACK,
                                      size: 14,
                                      weight: FontWeight.w600,
                                    ),
                                    gap,
          
                                    AppText(
                                      text: '1 within Hour',
                                      color: ColorResources.BLACK,
                                      size: 21,
                                      weight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        gapLarge,
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorResources.WHITE,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: ColorResources.ICONCOLOR,
                                    width: .5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: padding,
                                    horizontal: paddingLarge,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.visibility_outlined,
                                        color: ColorResources.BLACK,
                                      ),
                                      AppText(text: 'View Similar',size: 14,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            gapHorizontal,
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorResources.WHITE,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: ColorResources.ICONCOLOR,
                                    width: .5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: padding,
                                    horizontal: paddingLarge,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        CupertinoIcons.collections,
                                        color: ColorResources.BLACK,
                                      ),
                                      AppText(text: 'Compare',size: 14,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                         gapLarge,
                  AppText(text: 'Similar Products',size: 18,weight: FontWeight.w600,),
                      ],
                    ),
                  ),
                 
                  gapLarge,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppText(
                            text: '52,082+ Iteams ',
                            size: 18,
                            weight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorResources.WHITE,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: ColorResources.defshadow,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: paddingTiny,
                              horizontal: padding,
                            ),
                            child: Row(
                              children: [
                                AppText(text: 'Sort'),
                                gapHorizontalSmall,
                                Icon(
                                  Icons.compare_arrows,
                                  color: ColorResources.BLACK,
                                ),
                              ],
                            ),
                          ),
                        ),
                        gapHorizontal,
                        Container(
                          decoration: BoxDecoration(
                            color: ColorResources.WHITE,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: ColorResources.defshadow,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: paddingTiny,
                              horizontal: padding,
                            ),
                            child: Row(
                              children: [
                                AppText(text: 'Filter'),
                                gapHorizontalSmall,
                                Icon(
                                  Icons.filter_alt_outlined,
                                  color: ColorResources.BLACK,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  gapLarge,
                  Padding(
                    padding: const EdgeInsets.only(left: paddingLarge),
                    child: SizedBox(
                      height: 186,
                      child: ListView.builder(
                        itemCount: state.similarproduct?.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Products data = state.similarproduct![index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Container(
                              width: 174,
                              height: 186,
                              decoration: BoxDecoration(
                                color: ColorResources.WHITE,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(padding),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 174,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            data.image!,
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    gap,
                                    AppText(
                                      text:data.title??'',
                                      size: 10,
                                      weight: FontWeight.w500,
                                    ),
                                    AppText(
                                      text: '$rupesssymbol ${data.price}',
                                      size: 10,
                                      weight: FontWeight.w500,
                                    ),
                                    Row(
                                      children: [
                                        AppText(
                                          text: '$rupesssymbol ${data.mrp}',
                                          size: 10,
                                          weight: FontWeight.w300,
                                          color: ColorResources.HINTTEXT,
                                          decoration: TextDecoration.lineThrough,
                                          deccolor: ColorResources.HINTTEXTDARK,
                                        ),
                                        gapHorizontal,
                                        AppText(
                                          text: '${data.off}%Off',
                                          size: 10,
                                          weight: FontWeight.w300,
                                          color: ColorResources.AMTRED,
                                        ),
                                      ],
                                    ),
                                    gapLarge,
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

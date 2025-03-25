import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopywell_app/core/helper/help_loader.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';
import 'package:shopywell_app/view/presentation/product/view/productscreen.dart';
import 'package:shopywell_app/view/presentation/whishlist/viewmodel/bloc/whishlist_bloc.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/helper/help_screensize.dart';
import '../../../../core/utils/theme/colors.dart';
import '../../../../core/utils/theme/dimensions.dart';
import '../../../components/apptext.dart';
import '../../../components/apptextfeild.dart';

class WhishListScreen extends StatefulWidget {
   const WhishListScreen({super.key});

  @override
  State<WhishListScreen> createState() => _WhishListScreenState();
}

class _WhishListScreenState extends State<WhishListScreen> {
   TextEditingController searchCtrl = TextEditingController();
   @override
  void initState() {
    context.read<WhishlistBloc>().add(WhishListInitEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WhishlistBloc,WhishlistState>(
      builder: (context, state) {
        if (state.status == WhishListStatus.loading) {
          return PageEntryLoader();
        }
        if (state.status == WhishListStatus.error) {
          return CustomError(
            height: ScreenUtil.screenHeight,
          );
        }
      return SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                  child: AppTextFeild(
                    controller: searchCtrl,
                    filledcolor: ColorResources.WHITE,
                    borderstyle: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    prefix: Icon(
                      CupertinoIcons.search,
                      color: ColorResources.ICONCOLOR,
                    ),
                    hinttext: 'Saerch any Products',
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        CupertinoIcons.mic,
                        color: ColorResources.ICONCOLOR,
                      ),
                    ),
                  ),
                ),
                gap,
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
                  padding: const EdgeInsets.symmetric(horizontal:  paddingLarge),
                  child: MasonryGridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              itemCount:
                                  state.products.length,
                              itemBuilder: (context, index) {
                               Products data = state.products[index];
                                return GestureDetector(
                                  onTap: () {
                                    Screen.open(context, ProductScreen(productid: data.id??'',));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(padding),
                                      color: ColorResources.WHITE,
                                      boxShadow: ColorResources.smallshadow
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            padding,
                                          ),
                                          child: Image.network(
                                            data.image!
                                          ),
                                        ),
                                        gap,
                                    Padding(
                                      padding: const EdgeInsets.all(padding),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          AppText(
                                            text: data.title??'',
                                            size: 16,
                                            weight: FontWeight.w500,
                                            maxline: 1,
                                          ),
                                           AppText(
                                        text: data.description??'',
                                        size: 10,
                                        weight: FontWeight.w400,
                                        maxline: 2,
                                      ),
                                      AppText(
                                        text: '$rupesssymbol ${data.price}',
                                        size: 12,
                                        weight: FontWeight.w500,
                                      ),
                                   
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 12,
                                            initialRating: data.rating?.rate??0.0,
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
                                                  color: ColorResources.STARCOLOR,
                                                ),
                                            tapOnlyMode: false,
                                            unratedColor: ColorResources.HINTTEXT,
                                            onRatingUpdate: (rating) {},
                                          ),
                                          gapHorizontal,
                                          AppText(
                                            text: data.rating?.count.toString()??'',
                                            color: ColorResources.HINTTEXT,
                                            size: 10,
                                            weight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                        ],
                                      ),
                                    ),
                                   
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                ),
            ],
          ),
        ),
      );
  });
  }
}
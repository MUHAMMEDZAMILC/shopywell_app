import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/view/presentation/product/view/productscreen.dart';

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
  Widget build(BuildContext context) {
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
                                10,
                            itemBuilder: (context, index) {
                             
                              return GestureDetector(
                                onTap: () {
                                  Screen.open(context, ProductScreen());
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
                                          'https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1000,h_1000/global/079467/01/fnd/SEA/fmt/png/Core-Base-Backpack',
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
                                          text: 'Michael Kors',
                                          size: 16,
                                          weight: FontWeight.w500,
                                          maxline: 1,
                                        ),
                                         AppText(
                                      text: 'Black Edith Small Satchel',
                                      size: 10,
                                      weight: FontWeight.w400,
                                      maxline: 2,
                                    ),
                                    AppText(
                                      text: '$rupesssymbol 28,990',
                                      size: 12,
                                      weight: FontWeight.w500,
                                    ),
                                 
                                    Row(
                                      children: [
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
                                                color: ColorResources.STARCOLOR,
                                              ),
                                          tapOnlyMode: false,
                                          unratedColor: ColorResources.HINTTEXT,
                                          onRatingUpdate: (rating) {},
                                        ),
                                        gapHorizontal,
                                        AppText(
                                          text: '37623',
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
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appimageassets.dart';
import 'package:shopywell_app/view/components/appsvg.dart';
import '../../../../core/utils/theme/colors.dart';
import '../../../../core/utils/theme/dimensions.dart';
import '../../../components/appbutton.dart';
import '../../../components/apptext.dart';
import '../../../components/apptextfeild.dart';
import '../model/homecaro_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController();
   List<HomeCaro> list = [
    HomeCaro(
      title: '50-40% OFF',
      subtitle: 'Now in (product) \nAll colours',
      btntext: 'Shop Now',
    ),
    HomeCaro(
      title: '70-80% OFF',
      subtitle: 'Now in Brands',
      btntext: 'Explore',
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
              child: AppTextFeild(
                controller: searchCtrl,
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
                      text: 'All Featured',
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
              child: Container(
                height: 87,
                width: ScreenUtil.screenWidth,
                decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(padding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: ColorResources.SIZECHARTRED,
                            child: AppText(
                              text: 'S',
                              size: 18,
                              color: ColorResources.WHITE,
                            ),
                          ),

                          AppText(
                            text: 'Shirt',
                            size: 10,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            gapLarge,
            SizedBox(
                  width: ScreenUtil.screenWidth,
                  // height: ScreenUtil.screenHeight! * 0.2,
                  child: ExpandableCarousel(
                    options: ExpandableCarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: TreeSliver.defaultAnimationCurve,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 1,
                      showIndicator: true,
                      indicatorMargin: 30,
                      floatingIndicator: true,

                    ),
                    items:
                        list.map((i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: [
                                
                                AppImageAsset(assetName: offbg),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: padding26,horizontal: paddingLarge),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppText(text: i.title??'',color: ColorResources.WHITE,size: 20,letterspace:0.5 ,weight: FontWeight.w700,),
                                      // gapLarge,
                                      AppText(text: i.subtitle??'',color: ColorResources.WHITE,size: 12,letterspace:0.5 ,weight: FontWeight.w400,),
                                      gap21,
                                      ApBtn(
                                        height: 40,
                                        width: ScreenUtil.screenWidth!*0.4,
                                        buttonStyle: ButtonStyle(
                                          backgroundColor: WidgetStatePropertyAll(ColorResources.TRANSPARENT),
                                          shadowColor: WidgetStatePropertyAll(ColorResources.TRANSPARENT),
                                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            side: BorderSide(color: ColorResources.WHITE,width: 1)
                                          ))
                                        ),
                                        onPressed: () {
                                        
                                      }, isValid: true,child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(text: i.btntext??'',color: ColorResources.WHITE,size: 12,weight: FontWeight.w600,),
                                          gapHorizontal,
                                          Icon(Icons.arrow_forward_outlined,color: ColorResources.WHITE,)
                                        ],
                                      ),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),
                gapLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  paddingLarge),
                  child: Container(
                    width: ScreenUtil.screenWidth,
                    decoration: BoxDecoration(
                      color: ColorResources.CONTAINERBLUE,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(text: 'Deal of the Day',color: ColorResources.WHITE,size: 16,weight: FontWeight.w500,),
                              gap,
                              Row(
                                children: [
                                  Icon(CupertinoIcons.timer_fill,color: ColorResources.WHITE,size: 16,),
                                  gapHorizontal,
                                  AppText(text: '22h 55m 20s remaining ',color: ColorResources.WHITE,size: 12,weight: FontWeight.w400,),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          ApBtn(
                                        height: 35,
                                        width: ScreenUtil.screenWidth!*0.3,
                                        buttonStyle: ButtonStyle(
                                          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                                          backgroundColor: WidgetStatePropertyAll(ColorResources.TRANSPARENT),
                                          shadowColor: WidgetStatePropertyAll(ColorResources.TRANSPARENT),
                                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                            side: BorderSide(color: ColorResources.WHITE,width: 1)
                                          ))
                                        ),
                                        onPressed: () {
                                        
                                      }, isValid: true,child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppText(text: 'View All',color: ColorResources.WHITE,size: 12,weight: FontWeight.w600,),
                                          Icon(Icons.arrow_forward_outlined,color: ColorResources.WHITE,)
                                        ],
                                      ),)
                        ],
                      ),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}

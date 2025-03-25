// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appsvg.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/presentation/product/view/widgets/circleindicator.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentIndex = 0; // Track the current index
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApBarMn(titlename: 'Product', isback: true, titleonly: true),
      body: SizedBox(
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
                        children: [
                          Padding(
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
                                'https://s3-alpha-sig.figma.com/img/a439/201b/28a5cc919cb5324522742903efa1cc83?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=XqaY9g8x72j~uhYiVikXEUHC3-BPsTEPlDzb3qkpf8S-2PYXNTOrK4aB4JgbllxfBoRCeImorxhi9Bv9emz8Mtedz6R7CffkD0hzdHpwb1rQlxFIrzL7pah~caX0SwMkg9dqN2getkS2An8znr~VJ7rQpetkxMM3G3pS8~hqULoVg9lvxftB0DhYhiLU137vWHzvf08hHiVhP0UZIj-TjrH3bX03IY0urehH1qC9cV7CF98k8PrjjwhmS4d23~hxCgodiv-xlJ1N0U1CgYPtwGtS5eXXmMsAyKs2-wCjIh3hWdYEYmLr96O5UWapJgj195F8whM~uVcZoF5Ao3qYpA__',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: padding),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              width: ScreenUtil.screenWidth,
                              height: 220,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  paddingLarge,
                                ),
                              ),
                              child: Image.network(
                                'https://s3-alpha-sig.figma.com/img/0f33/785d/323eb72bd7dfbb7bde12845c05800bfe?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=TxzJeBJszdjQxqq7-2CRhctErm9R2fNk23pPmWt1MvxyGejgpi8gYMsoY22ioFCe1Ele-~0StofpX5xQ4Oji9KVBNXhDnCQY-cL2GIBhAMokmkYkHfoe9mFvNGGspydBVyalgMP8VUadjAaX28YApr-3llz8W5ELDdkHuQsaAuDz9zlGufJmFwuzZlhdlFkIaPfD6JovEXm9J235O8RHTm1MCjoQAfLr1cBCrGZTfAITVDSFgNE2HZY6SuAVqHhzvPsgdSqEVf2mHmyEbNfD4bo0izWz1~RrmJzrHFH86lnifdoWkE-EylBZzgWPcDYLnDa28zqYsm2pB2-zFsOWKw__',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
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
                      text: 'NIke Sneakers',
                      size: 20,
                      weight: FontWeight.w600,
                    ),
                    AppText(
                      text: 'Vision Alta Men’s Shoes Size (All Colours)',
                      size: 14,
                      weight: FontWeight.w400,
                      maxline: 2,
                    ),
                    gap,
                    Row(
                      children: [
                        RatingBar.builder(
                          itemSize: 18,
                          initialRating: 3.5,
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
                          text: '37623',
                          color: ColorResources.HINTTEXT,
                          size: 14,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                    AppText(
                      text:
                          'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the ...',
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
                        AppSvg(assetName: gotocart),
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
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
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
                                        'https://media.darveys.com/catalog/product/5/7/573-lot6242_1.jpg',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                gap,
                                AppText(
                                  text: 'Michael Kors',
                                  size: 10,
                                  weight: FontWeight.w500,
                                ),
                                AppText(
                                  text: '$rupesssymbol 28,990',
                                  size: 10,
                                  weight: FontWeight.w500,
                                ),
                                Row(
                                  children: [
                                    AppText(
                                      text: '$rupesssymbol 42,500',
                                      size: 10,
                                      weight: FontWeight.w300,
                                      color: ColorResources.HINTTEXT,
                                      decoration: TextDecoration.lineThrough,
                                      deccolor: ColorResources.HINTTEXTDARK,
                                    ),
                                    gapHorizontal,
                                    AppText(
                                      text: '40%Off',
                                      size: 10,
                                      weight: FontWeight.w300,
                                      color: ColorResources.AMTRED,
                                    ),
                                  ],
                                ),
                                
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
      ),
    );
  }
}

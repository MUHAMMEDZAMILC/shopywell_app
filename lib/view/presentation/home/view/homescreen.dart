// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/help_loader.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/view/components/appimageassets.dart';
import 'package:shopywell_app/view/components/appsvg.dart';
import 'package:shopywell_app/view/presentation/home/viewmodel/bloc/home_bloc.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';
import 'package:shopywell_app/view/presentation/whishlist/viewmodel/bloc/whishlist_bloc.dart';
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
  void initState() {
    context.read<HomeBloc>().add(HomeInitEvent(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.lodaing) {
          return PageEntryLoader();
        }
        if (state.status == HomeStatus.error) {
          return CustomError(height: ScreenUtil.screenHeight);
        }
        return SizedBox(
          width: ScreenUtil.screenWidth,
          height: ScreenUtil.screenHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                  child: AppTextFeild(
                    controller: searchCtrl,
                    filledcolor: ColorResources.WHITE,
                    borderstyle: OutlineInputBorder(
                      borderSide: BorderSide.none,
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
                      itemCount: state.pproducts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Products data = state.pproducts[index];
                        return Padding(
                          padding: const EdgeInsets.all(padding),
                          child: SizedBox(
                            width: 55,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 26,
                                  backgroundColor: ColorResources.SIZECHARTRED,
                                  backgroundImage: NetworkImage(
                                    data.image ?? '',
                                  ),
                                ),

                                AppText(
                                  text: data.title ?? '',
                                  maxline: 1,
                                  size: 10,
                                  weight: FontWeight.w400,
                                ),
                              ],
                            ),
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
                            padding: const EdgeInsets.symmetric(
                              horizontal: paddingLarge,
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional.centerStart,
                              children: [
                                AppImageAsset(assetName: offbg),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: padding26,
                                    horizontal: paddingLarge,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: i.title ?? '',
                                        color: ColorResources.WHITE,
                                        size: 20,
                                        letterspace: 0.5,
                                        weight: FontWeight.w700,
                                      ),
                                      // gapLarge,
                                      AppText(
                                        text: i.subtitle ?? '',
                                        color: ColorResources.WHITE,
                                        size: 12,
                                        letterspace: 0.5,
                                        weight: FontWeight.w400,
                                      ),
                                      gap21,
                                      ApBtn(
                                        height: 40,
                                        width: ScreenUtil.screenWidth! * 0.4,
                                        buttonStyle: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                ColorResources.TRANSPARENT,
                                              ),
                                          shadowColor: WidgetStatePropertyAll(
                                            ColorResources.TRANSPARENT,
                                          ),
                                          shape: WidgetStatePropertyAll<
                                            RoundedRectangleBorder
                                          >(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              side: BorderSide(
                                                color: ColorResources.WHITE,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        isValid: true,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppText(
                                              text: i.btntext ?? '',
                                              color: ColorResources.WHITE,
                                              size: 12,
                                              weight: FontWeight.w600,
                                            ),
                                            gapHorizontal,
                                            Icon(
                                              Icons.arrow_forward_outlined,
                                              color: ColorResources.WHITE,
                                            ),
                                          ],
                                        ),
                                      ),
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
                  padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
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
                              AppText(
                                text: 'Deal of the Day',
                                color: ColorResources.WHITE,
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                              gap,
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.timer_fill,
                                    color: ColorResources.WHITE,
                                    size: 16,
                                  ),
                                  gapHorizontal,
                                  AppText(
                                    text: '22h 55m 20s remaining ',
                                    color: ColorResources.WHITE,
                                    size: 12,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          ApBtn(
                            height: 35,
                            width: ScreenUtil.screenWidth! * 0.3,
                            buttonStyle: ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 8),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                ColorResources.TRANSPARENT,
                              ),
                              shadowColor: WidgetStatePropertyAll(
                                ColorResources.TRANSPARENT,
                              ),
                              shape: WidgetStatePropertyAll<
                                RoundedRectangleBorder
                              >(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: BorderSide(
                                    color: ColorResources.WHITE,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            isValid: true,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: 'View All',
                                  color: ColorResources.WHITE,
                                  size: 12,
                                  weight: FontWeight.w600,
                                ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: ColorResources.WHITE,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                gapLarge,
                Padding(
                  padding: const EdgeInsets.only(left: paddingLarge),
                  child: SizedBox(
                    height: 241,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: state.pproducts.length,
                      itemBuilder: (context, index) {
                        Products data = state.pproducts[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Container(
                            width: 174,
                            height: 241,
                            decoration: BoxDecoration(
                              color: ColorResources.WHITE,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(padding),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 174,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              data.image ?? '',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 2,
                                        top: 2,
                                        child: GestureDetector(
                                          onTap: () async {
                                            context.read<WhishlistBloc>().add(
                                              WhishListAddProductEvent(
                                                context: context,
                                                productid: data.id!,

                                              ),
                                            );
                                             context.read<WhishlistBloc>().stream.firstWhere((element) => element.status == WhishListStatus.addsuccess).then((value) {
                                               context.read<HomeBloc>().add(HomegetproductEvent(context));
                                             },);
                                          },
                                          child: Icon(
                                            data.whish == 1
                                                ? CupertinoIcons.heart_fill
                                                : CupertinoIcons.heart,
                                            color:
                                                data.whish == 1
                                                    ? ColorResources.BTNRED
                                                    : null,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  gap,
                                  AppText(
                                    text: data.title ?? '',
                                    size: 12,
                                    maxline: 1,
                                    weight: FontWeight.w500,
                                  ),
                                  AppText(
                                    text: data.description ?? '',
                                    size: 10,
                                    maxline: 2,
                                    weight: FontWeight.w400,
                                  ),
                                  AppText(
                                    text: '$rupesssymbol ${data.price}',
                                    size: 12,
                                    weight: FontWeight.w500,
                                  ),
                                  Row(
                                    children: [
                                      AppText(
                                        text: '$rupesssymbol ${data.mrp}',
                                        size: 12,
                                        weight: FontWeight.w300,
                                        color: ColorResources.HINTTEXT,
                                        decoration: TextDecoration.lineThrough,
                                        deccolor: ColorResources.HINTTEXTDARK,
                                      ),
                                      gapHorizontal,
                                      AppText(
                                        text: '${data.off} %Off',
                                        size: 12,
                                        weight: FontWeight.w300,
                                        color: ColorResources.AMTRED,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                        itemSize: 12,
                                        initialRating: data.rating?.rate ?? 0.0,
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
                                        text:
                                            data.rating?.count.toString() ?? '',
                                        color: ColorResources.HINTTEXT,
                                        size: 10,
                                        weight: FontWeight.w400,
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
                gapLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: ColorResources.WHITE,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(padding),
                      child: Row(
                        children: [
                          AppImageAsset(assetName: offer),
                          gapHorizontal,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    AppText(
                                      text: 'Special Offers',
                                      size: 16,
                                      weight: FontWeight.w500,
                                    ),
                                    AppImageAsset(assetName: emoji),
                                  ],
                                ),
                                AppText(
                                  text:
                                      'We make sure you get the offer you need at best prices',
                                  size: 12,
                                  maxline: 2,
                                  weight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                gapLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                  child: SizedBox(
                    width: ScreenUtil.screenWidth,
                    height: 171,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          left: 0,
                          child: AppSvg(assetName: yellowrectangle),
                        ),
                        Positioned(
                          left: 2,
                          child: AppSvg(assetName: yellowscatter),
                        ),
                        Positioned(
                          left: 16,
                          child: AppImageAsset(assetName: ldchappal),
                        ),
                        Positioned(
                          right: paddingLarge,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppText(
                                text: 'Flat and Heels',
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                              gap,
                              AppText(
                                text: 'Stand a chance to get rewarded',
                                size: 10,
                                weight: FontWeight.w400,
                              ),
                              gapLarge,
                              ApBtn(
                                height: 35,
                                width: ScreenUtil.screenWidth! * 0.3,
                                buttonStyle: ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 8),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    ColorResources.BTNRED,
                                  ),
                                  shadowColor: WidgetStatePropertyAll(
                                    ColorResources.TRANSPARENT,
                                  ),
                                  shape: WidgetStatePropertyAll<
                                    RoundedRectangleBorder
                                  >(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                isValid: true,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: 'Visit Now',
                                      color: ColorResources.WHITE,
                                      size: 12,
                                      weight: FontWeight.w600,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_outlined,
                                      color: ColorResources.WHITE,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                gapLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                  child: Container(
                    width: ScreenUtil.screenWidth,
                    decoration: BoxDecoration(
                      color: ColorResources.CONTAINERLIGHTRED,
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
                                text: 'Trending Products ',
                                color: ColorResources.WHITE,
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                              gap,
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.calendar,
                                    color: ColorResources.WHITE,
                                    size: 16,
                                  ),
                                  gapHorizontal,
                                  AppText(
                                    text: 'Last Date 29/02/22',
                                    color: ColorResources.WHITE,
                                    size: 12,
                                    weight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          ApBtn(
                            height: 35,
                            width: ScreenUtil.screenWidth! * 0.3,
                            buttonStyle: ButtonStyle(
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 8),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                ColorResources.TRANSPARENT,
                              ),
                              shadowColor: WidgetStatePropertyAll(
                                ColorResources.TRANSPARENT,
                              ),
                              shape: WidgetStatePropertyAll<
                                RoundedRectangleBorder
                              >(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  side: BorderSide(
                                    color: ColorResources.WHITE,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            isValid: true,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: 'View All',
                                  color: ColorResources.WHITE,
                                  size: 12,
                                  weight: FontWeight.w600,
                                ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: ColorResources.WHITE,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                      itemCount: state.pproducts.length,
                      itemBuilder: (context, index) {
                        Products data = state.pproducts[index];
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 174,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                        image: NetworkImage(data.image ?? ''),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  gap,
                                  AppText(
                                    text: data.title ?? '',
                                    maxline: 1,
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
                                ],
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
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    width: ScreenUtil.screenWidth,
                    // height: ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorResources.WHITE,
                    ),
                    child: Column(
                      children: [
                        AppImageAsset(assetName: hotsummer),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: 'New Arrivals',
                                      size: 20,
                                      weight: FontWeight.w500,
                                    ),
                                    AppText(
                                      text: 'Summer 25 Collections',
                                      size: 16,
                                      weight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                              ApBtn(
                                height: 35,
                                width: ScreenUtil.screenWidth! * 0.3,
                                buttonStyle: ButtonStyle(
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 8),
                                  ),
                                  backgroundColor: WidgetStatePropertyAll(
                                    ColorResources.BTNRED,
                                  ),
                                  shadowColor: WidgetStatePropertyAll(
                                    ColorResources.TRANSPARENT,
                                  ),
                                  shape: WidgetStatePropertyAll<
                                    RoundedRectangleBorder
                                  >(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                isValid: true,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: 'Visit Now',
                                      color: ColorResources.WHITE,
                                      size: 12,
                                      weight: FontWeight.w600,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_outlined,
                                      color: ColorResources.WHITE,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                gapLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingLarge),
                  child: Container(
                    width: ScreenUtil.screenWidth,
                    decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(paddingLarge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Sponserd',
                            size: 20,
                            weight: FontWeight.w500,
                          ),
                          gapLarge,
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: AppImageAsset(assetName: 'shoe.png'),
                          ),
                          gapLarge,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: 'Up to 25% off ',
                                size: 16,
                                weight: FontWeight.w700,
                              ),
                              Icon(CupertinoIcons.chevron_forward),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';

import '../../../../../core/utils/theme/colors.dart';
import '../../../../../core/utils/theme/dimensions.dart';
import '../../../../components/appsvg.dart';
import '../../../../components/apptext.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        SizedBox(
          width: ScreenUtil.screenWidth,
          height: ScreenUtil.screenHeight!*0.5,
          child: Center(child: AppSvg(assetName: image))),
        AppText(
          text: title,
          color: ColorResources.TEXTCOLORHEAD,
          size: 24,
          weight: FontWeight.w800,
        ),
        gap,
        AppText(
          text: description,
          textalign: TextAlign.center,
          color: ColorResources.TEXTCOLORSUB,
          size: 14,
          maxline: 5,
          weight: FontWeight.w600,
        ),
      ],
    );
  }
}
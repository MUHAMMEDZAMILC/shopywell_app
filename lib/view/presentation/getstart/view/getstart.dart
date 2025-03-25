// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/view/components/appbutton.dart';
import 'package:shopywell_app/view/components/appimageassets.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/presentation/signin/view/loginscreen.dart';

import '../../../../core/utils/theme/dimensions.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AppImageAsset(assetName: startbg,fit: BoxFit.cover,width: ScreenUtil.screenWidth,height: ScreenUtil.screenHeight,),
            Container(
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight!*0.4,
              decoration: BoxDecoration(
               gradient: LinearGradient(colors: [
                ColorResources.BLACK.withOpacity(0.63),
                ColorResources.BLACK.withOpacity(0.0),

               ],begin: AlignmentDirectional.bottomCenter,end: AlignmentDirectional.center)
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                AppText(text: 'You want \nAuthentic, here \nyou go!',color: ColorResources.WHITE,textalign: TextAlign.center,size: 34,weight: FontWeight.w600,),
                gap,
                AppText(text: 'Find it here, buy it now!',size: 14,weight: FontWeight.w400,color: ColorResources.WHITE,),
                44.hBox,
                ApBtn(
                  width: ScreenUtil.screenWidth!*0.7,
                  onPressed: () {
                  Screen.openClosingCurrentPage(context, LoginScreen());
                }, isValid: true,child: AppText(text: 'Get Start',
                  color: ColorResources.WHITE,
                 ),)
,16.hBox,
              ],
            )
          ],
        ),
      ),
    );
  }
}
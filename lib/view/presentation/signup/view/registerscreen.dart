import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';
import 'package:shopywell_app/view/presentation/signin/view/loginscreen.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/helper/pagenavigator.dart';
import '../../../../core/utils/theme/colors.dart';
import '../../../../core/utils/theme/dimensions.dart';
import '../../../components/appbutton.dart';
import '../../../components/appimageassets.dart';
import '../../../components/apprichtext.dart';
import '../../../components/appsvg.dart';
import '../../../components/apptext.dart';
import '../../../components/apptextfeild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameCtrl = TextEditingController(),
      passwordCtrl = TextEditingController(),
      confirmpsCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Padding(
          padding: const EdgeInsets.all(paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               45.hBox,
              AppText(
                text: 'Create an \naccount',
                size: 36,
                weight: FontWeight.w700,
              ),
              gap21,
              AppTextFeild(
                controller: usernameCtrl,
                hinttext: 'Username / Email',
                label: 'Username / Email',
                prefix: Icon(CupertinoIcons.person_fill),
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: ColorResources.HINTTEXTDARK,
                  fontFamily: 'Montserrat',
                ),
                borderstyle: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: ColorResources.TEXTFEILDBORDERDARK,
                    width: 1,
                  ),
                ),
                filledcolor: ColorResources.TEXTFEILDFILL,
              ),
              gap21,
              AppTextFeild(
                controller: passwordCtrl,
                hinttext: 'Password',
                label: 'Password',
                prefix: Icon(CupertinoIcons.lock_fill),
                suffix: Padding(
                  padding: const EdgeInsets.only(right: padding),
                  child: Icon(Icons.visibility_outlined),
                ),
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: ColorResources.HINTTEXTDARK,
                  fontFamily: 'Montserrat',
                ),
                borderstyle: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: ColorResources.TEXTFEILDBORDERDARK,
                    width: 1,
                  ),
                ),
                filledcolor: ColorResources.TEXTFEILDFILL,
              ),
              gap21,
              AppTextFeild(
                controller: confirmpsCtrl,
                hinttext: 'Confirm Password',
                label: 'Confirm Password',
                prefix: Icon(CupertinoIcons.lock_fill),
                suffix: Padding(
                  padding: const EdgeInsets.only(right: padding),
                  child: Icon(Icons.visibility_outlined),
                ),
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: ColorResources.HINTTEXTDARK,
                  fontFamily: 'Montserrat',
                ),
                borderstyle: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: ColorResources.TEXTFEILDBORDERDARK,
                    width: 1,
                  ),
                ),
                filledcolor: ColorResources.TEXTFEILDFILL,
              ),
              gap21,
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: 'By clicking the ',style: TextStyle(color: ColorResources.HINTTEXTDARK,fontFamily: 'Montserrat',fontSize: 12,fontWeight: FontWeight.w400)),
                  TextSpan(text: 'Register ',style: TextStyle(color: ColorResources.PRIMARYCOLOR,fontFamily: 'Montserrat',fontSize: 12,fontWeight: FontWeight.w400)),
                  TextSpan(text: 'button, you agree to the public offer',style: TextStyle(color: ColorResources.HINTTEXTDARK,fontFamily: 'Montserrat',fontSize: 12,fontWeight: FontWeight.w400)),
                ]
              )),
              gap26,
              ApBtn(
                onPressed: () {
                  // Screen.op
                },
                isValid: true,
                child: AppText(
                  text: 'Create Account',
                  size: 20,
                  color: ColorResources.WHITE,
                  weight: FontWeight.w600,
                ),
              ),
               gap26,
              gap26,
              Align(
                alignment: AlignmentDirectional.center,
                child: AppText(
                  text: '- Or Continue with -',
                  size: 12,
                  textalign: TextAlign.center,
                  color: ColorResources.TEXTCOLORSUBLIGHT,
                ),
              ),
              gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImageAsset(assetName: google),
                  gapHorizontal,
                  AppSvg(assetName: facebook),
                  gapHorizontal,
                  AppSvg(assetName: apple),
                ],
              ),
              gap21,
              Align(
                alignment: AlignmentDirectional.center,
                child: GestureDetector(
                  onTap: () {
                    Screen.openClosingCurrentPage(context, LoginScreen());
                  },
                  child: AppRichText(
                    normalText: 'I Already Have an Account ',
                    richText: 'Login',
                    normalTextColor: ColorResources.TEXTCOLORSUBLIGHT,
                    fontSize: 14,
                    richTextColor: ColorResources.PRIMARYCOLOR,
                    richFontWeight: FontWeight.w600,
                    richtextdec: TextDecoration.underline,
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
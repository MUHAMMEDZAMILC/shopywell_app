import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appbutton.dart';
import 'package:shopywell_app/view/components/appimageassets.dart';
import 'package:shopywell_app/view/components/apprichtext.dart';
import 'package:shopywell_app/view/components/appsvg.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/components/apptextfeild.dart';
import 'package:shopywell_app/view/presentation/forgot/view/forgotpassscreen.dart';
import 'package:shopywell_app/view/presentation/home/view/homescreen.dart';
import 'package:shopywell_app/view/presentation/landing/view/landingscreen.dart';
import 'package:shopywell_app/view/presentation/signup/view/registerscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameCtrl = TextEditingController(),
      passwordCtrl = TextEditingController();
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
                text: 'Welcome \nBack!',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Screen.openClosingCurrentPage(context, ForgotpasswordScreen());
                    },
                    child: AppText(
                      text: 'Forgot Password?',
                      color: ColorResources.PRIMARYCOLOR,
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              gap26,
              ApBtn(
                onPressed: () {
                  Screen.openAsNewPage(context, LandingScreen());
                },
                isValid: true,
                child: AppText(
                  text: 'Login',
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
                    Screen.openClosingCurrentPage(context, RegisterScreen());
                  },
                  child: AppRichText(
                    normalText: 'Create An Account ',
                    richText: 'Sign Up',
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';

import '../../../../core/utils/theme/colors.dart';
import '../../../../core/utils/theme/dimensions.dart';
import '../../../components/appbutton.dart';
import '../../../components/apprichtext.dart';
import '../../../components/apptext.dart';
import '../../../components/apptextfeild.dart';

class ForgotpasswordScreen extends StatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  State<ForgotpasswordScreen> createState() => _ForgotpasswordScreenState();
}

class _ForgotpasswordScreenState extends State<ForgotpasswordScreen> {
  TextEditingController emailCtrl = TextEditingController();
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
                text: 'Forgot \npassword?',
                size: 36,
                weight: FontWeight.w700,
              ),
              gap21,
              AppTextFeild(
                controller: emailCtrl,
                hinttext: 'Email',
                label: 'Email',
                prefix: Icon(CupertinoIcons.mail_solid),
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
             gap26,
             AppRichText(
                    normalText: '* ',
                    richText: 'We will send you a message to set or reset your new password',
                    normalTextColor: ColorResources.PRIMARYCOLOR,
                    fontSize: 12,
                    richTextColor: ColorResources.TEXTCOLORSUBLIGHT,
                    richFontWeight: FontWeight.w400,
                  ),
                  gap26,
                  ApBtn(
                onPressed: () {
                  // Screen.op
                },
                isValid: true,
                child: AppText(
                  text: 'Submit',
                  size: 20,
                  color: ColorResources.WHITE,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
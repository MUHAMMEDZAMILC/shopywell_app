import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appbutton.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/components/apptextfeild.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController usernameCtrl = TextEditingController(),
  passwordCtrl = TextEditingController(),
  pincodeCtrl = TextEditingController(),
  addressCtrl = TextEditingController(),
  cityCtrl = TextEditingController(),
  stateCtrl = TextEditingController(),
  countryCtrl = TextEditingController(),
  accnoCtrl = TextEditingController(),
  holdernameCtrl = TextEditingController(),
  ifscCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApBarMn(titlename: 'Profile', titleonly: true, isback: true),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Padding(
          padding: const EdgeInsets.all(paddingLarge),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://s3-alpha-sig.figma.com/img/e2db/1865/e7299c33d1d7de36aa46e37cda72d981?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=rbMKB70uUH-mVtYcuQxGR54-JopT8xK1hdmVprz7JnecURaeyla5IXfEXBLWUNa5eFlrfE7Pu4ztzgZST7MF2P5babXJ~maHh4YEETvaTnHivOfCkBr5jwZIN73LKbjIYvInZKga15x3LEL1RcJjaX5qbuu9rHGgMsSzKb4lRXmRgAQUDs5IcMfWbCK06PLysWLYaRAB1lHfGVUGCCkWMjfLuhUJq2cHwcaDKYRY7-ITqVNGAvklsZwjwXaUQbFbeGcgvYOcRbAeHZREandqCgdVsyA-TJhcGcuMPacXYlqcBWDo59CY0xNJ5VS8P~aQu2Yt8NfR7fVBtXIPlODKHA__',
                        ),
                      ),
                      Positioned(
                        bottom: -2,
                        right: -2,
                        child: CircleAvatar(
                          backgroundColor: ColorResources.WHITE,
                          radius: 16,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: ColorResources.CONTAINERBLUE,
                            child: Icon(Icons.edit, color: ColorResources.WHITE,size: 16,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                gapLarge,
                AppText(text: 'Personal Details', size: 18, weight: FontWeight.w600),
                gapLarge,
                AppText(text: 'Email Address', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: usernameCtrl,hinttext: 'Email or Username',),
                gapLarge,
                AppText(text: 'Password', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: passwordCtrl,hinttext: 'Password',),
                gapLarge,
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(onTap: (){},
                  child: AppText(text: 'Change Password', size: 12,color: ColorResources.BTNRED, weight: FontWeight.w400,deccolor: ColorResources.BTNRED,decoration: TextDecoration.underline,)),),
                gapLarge,
                 AppText(text: 'Business Address Details', size: 18, weight: FontWeight.w600),
                gapLarge,
                AppText(text: 'Pincode', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: pincodeCtrl,hinttext: 'Pincode',),
                gapLarge,
                AppText(text: 'Address', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: addressCtrl,hinttext: 'Address',),
                gapLarge,
                AppText(text: 'City', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: cityCtrl,hinttext: 'City',),
                gapLarge,
                AppText(text: 'State', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: stateCtrl,hinttext: 'State',),
                gapLarge,
                AppText(text: 'Country', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: countryCtrl,hinttext: 'Country',),
                gapLarge,
                AppText(text: 'Bank Details', size: 18, weight: FontWeight.w600),
                gapLarge,
                AppText(text: 'Account Number', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: accnoCtrl,hinttext: 'Account Number',),
                gapLarge,
                AppText(text: 'Account Holder Name', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: holdernameCtrl,hinttext: 'Account Holder Name',),
                gapLarge,
                AppText(text: 'IFSC Code', size: 12, weight: FontWeight.w400),
                gap,
                AppTextFeild(controller: ifscCtrl,hinttext: 'IFSC Code',),
                gapLarge,
                ApBtn(onPressed: () {
                  
                }, isValid: true,child: AppText(text: 'Save',color: ColorResources.WHITE,),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

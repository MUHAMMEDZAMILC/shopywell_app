// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../view/components/apptext.dart';
import '../utils/theme/colors.dart';
import 'help_screensize.dart';

class PgNoData extends StatelessWidget {
   PgNoData({super.key,this.message});
  String? message;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return  Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      color: ColorResources.SCAFFOLDBG,
      child:  Center(
        child:AppText(text: message??'Data Not Fund',color: ColorResources.WHITE,weight: FontWeight.w600,letterspace: 0.6,)
      ),
    );
  }
}

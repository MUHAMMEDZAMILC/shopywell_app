
// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';
import '../../core/helper/help_screensize.dart';
import '../../core/utils/theme/colors.dart';
import '../../core/utils/theme/dimensions.dart';
import 'apptext.dart';

// ignore: must_be_immutable
class ApDrpDwn extends StatelessWidget {
  ApDrpDwn(
      {super.key,
      required this.value,
      required this.list,
      this.label,
      this.hinttext,
      required this.onchange,
      this.itemtxtcolor,
      this.height,
      this.width,
      this.vcontentpadding,
      this.prefix,
      this.suffix,
      this.readonly,
      this.onTap,
      this.contentalign,
      this.filledcolor,
      this.hintStyle,
      this.textstyle,
      this.labelshow,this.digitsonly,this.multiline=1,this.isrequired=false});
  String? value;
  String? label, hinttext;
   void Function(dynamic value) onchange;
  List<String> list;
  Color? itemtxtcolor;
  TextStyle? textstyle, hintStyle;
  bool? readonly, labelshow,digitsonly,isrequired;
  Widget? suffix, prefix;
  double? height, width,vcontentpadding;
  int? multiline =1;
  Color? filledcolor;
  TextAlign? contentalign;

  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
                    height:height?? 50.78,
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
        border: Border.all(
                      color:ColorResources.WHITE.withOpacity(0.5), width: 0.42),
                    ),
                    child: DropdownButton(
                      
                      underline: 0.hBox,
                      padding: EdgeInsets.symmetric(horizontal:padding ),
                      borderRadius: BorderRadius.circular(10),
                      menuWidth: ScreenUtil.screenWidth!*0.7,
                      hint: AppText(text: hinttext??'',color: ColorResources.HINTTEXT,
                      weight: FontWeight.w400,
                      family: 'Montserrat',
                      size: 13,),
                      
                      isExpanded: true,
                      icon:suffix?? Icon(CupertinoIcons.chevron_down,color: ColorResources.WHITE,),
                      dropdownColor: ColorResources.WHITE,
                      value: value,
                      items: list.map((e) => DropdownMenuItem(value: e.toString(),child: AppText(text: e.toString(),color: itemtxtcolor??ColorResources.WHITE,maxline: 1,),)).toList(), onChanged:onchange,),
                  );
  }
}

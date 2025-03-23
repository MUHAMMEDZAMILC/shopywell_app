// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';

import '../../core/helper/help_screensize.dart';
import '../../core/utils/theme/colors.dart';
import '../../core/utils/theme/dimensions.dart';

// ignore: must_be_immutable
class AppTextFeild extends StatelessWidget {
  AppTextFeild({
    super.key,
    required this.controller,
    this.label,
    this.hinttext,
    this.isobsecure,
    this.type,
    this.height,
    this.width,
    this.vcontentpadding,
    this.prefix,
    this.suffix,
    this.readonly,
    this.onTap,
    this.onChanged,
    this.onvalidate,
    this.contentalign,
    this.borderstyle,
    this.filledcolor,
    this.hintStyle,
    this.textstyle,
    this.labelshow,
    this.digitsonly,
    this.multiline = 1,
    this.isrequired = false,
  });
  TextEditingController controller;
  String? label, hinttext;
  TextInputType? type;
  TextStyle? textstyle, hintStyle;
  bool? isobsecure, readonly, labelshow, digitsonly, isrequired;
  Widget? suffix, prefix;
  double? height, width, vcontentpadding;
  int? multiline = 1;
  Color? filledcolor;
  TextAlign? contentalign;
  OutlineInputBorder? borderstyle;
  Function()? onTap;
  Function(String value)? onChanged;
  String? Function(String? value)? onvalidate;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
      height: multiline != null ? (48 * multiline!).toDouble() : 48.toDouble(),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(
      //                 color:ColorResources.BLACK.withOpacity(1), width: 0.42),
      // ),
      child: Center(
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  onTap: onTap,
                  onChanged: onChanged,
                  obscureText: isobsecure ?? false,
                  validator: onvalidate,
                  enableSuggestions: false,
                  scribbleEnabled: false,
                  controller: controller,
                  keyboardType: type ?? TextInputType.text,
                  readOnly: readonly ?? false,
                  maxLines: multiline != 1 ? multiline! * 2 : multiline,
                  style:
                      textstyle ??
                      const TextStyle(
                        color: ColorResources.BLACK,
                        fontWeight: FontWeight.w300,

                        // fontSize: 14,
                      ),
                  inputFormatters:
                      digitsonly == true
                          ? <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d*'),
                            ),
                          ]
                          : [],
                  textAlign: contentalign ?? TextAlign.start,
                  decoration: InputDecoration(
                    suffixIconConstraints: BoxConstraints(),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: padding,
                      vertical: multiline != null ? 0 : vcontentpadding ?? 0,
                    ),
                    filled: filledcolor==null?false:true,
                    fillColor:
                        filledcolor ,
                    hintText: hinttext,

                    prefixIcon: prefix,
                    suffixIcon: suffix ?? 0.hBox,

                    labelText: label,
                    labelStyle: const TextStyle(
                      color: ColorResources.BLACK,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                    hintStyle:
                        hintStyle ??
                        const TextStyle(
                          color: ColorResources.HINTTEXT,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                        ),
                    border:
                        borderstyle ??
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                             color: ColorResources.TEXTFEILDBORDERLIGHT
                            ,
                            width: 0.42,
                          ),
                        ),
                    focusedBorder:
                        borderstyle ??
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: ColorResources.TEXTFEILDBORDERLIGHT
                            ,
                            width: 0.42,
                          ),
                        ),
                    enabledBorder:
                        borderstyle ??
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                           color: ColorResources.TEXTFEILDBORDERLIGHT
                            ,
                            width: 0.42,
                          ),
                        ),
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

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../core/utils/theme/colors.dart';

class AppText extends StatelessWidget {
  AppText({
    super.key,
    this.googlefont,
    this.color,
    required this.text,
    this.size,
    this.letterspace,
    this.weight,
    this.family,
    this.textalign,
    this.maxline,
    this.decoration,
    this.deccolor,
  });
  String text;
  String? family;
  Color? color,deccolor;
  double? size, letterspace;
  FontWeight? weight;
  TextStyle? googlefont;
  TextAlign? textalign;
  int? maxline = 1;
  TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline,
      style:
          googlefont ??
          TextStyle(
            color: color ?? ColorResources.TEXTCOLORHEAD,
            fontSize: size,
            fontWeight: weight,
            letterSpacing: letterspace,
            fontFamily: family ?? 'Montserrat',
            overflow: TextOverflow.ellipsis,
            decoration: decoration ,
            decorationColor: deccolor,
          ),
      textAlign: textalign ?? TextAlign.start,
    );
  }
}

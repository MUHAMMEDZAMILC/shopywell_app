import 'package:flutter/material.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';

class AppRichText extends StatelessWidget {
  final String normalText;
  final String richText;
  final String? fontFamily,richfontFamily;
  final Color normalTextColor, richTextColor,txtdeccolor,richtxtdeccolor;
  final FontWeight richFontWeight, normalFontWeight;
  final double? fontSize, richTextFontSize;
  final double? letterspace, richletterspace;
  final TextDecoration? textdec,richtextdec;

  const AppRichText(
      {super.key,
      required this.normalText,
      required this.richText,
      this.fontFamily,this.richfontFamily,
      this.normalTextColor = Colors.black,
      this.richTextColor = Colors.black,
      this.normalFontWeight = FontWeight.w300,
      this.richFontWeight = FontWeight.normal,
      this.fontSize,
      this.richTextFontSize,
      this.letterspace,
      this.richletterspace,
      this.textdec,
      this.richtextdec,
      this.txtdeccolor=ColorResources.BLACK,
      this.richtxtdeccolor = ColorResources.PRIMARYCOLOR,

      });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: normalText,
              style: TextStyle(
                  color: normalTextColor,
                  fontSize: fontSize ?? 12,
                  fontWeight: normalFontWeight,
                  decorationColor: txtdeccolor,
                  decoration: textdec,
                  fontFamily: 'Montserrat',
                  letterSpacing: letterspace)),
          TextSpan(
            text: richText,
            style: TextStyle(
                color: richTextColor,
                fontSize: richTextFontSize ?? (fontSize ?? 12),
                fontWeight: richFontWeight,
                fontFamily: 'Montserrat',
                decoration: richtextdec,
                decorationColor: richtxtdeccolor,
                letterSpacing: richletterspace),
          ),
        ],
      ),
    );
  }
}
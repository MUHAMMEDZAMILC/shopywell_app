// ignore_for_file: constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';

import 'dimensions.dart';



class ColorResources {
  static const Color PRIMARYCOLOR = Color(0xFFF40000);
  static const Color SECONDARYCOLOR = Color(0xFF17223B);
  static const Color SCAFFOLDBG = Color(0xFFF9F9F9);
  static const Color APPBARBG = Color(0xFFF9F9F9);
  static const Color TEXTCOLORHEAD = Colors.black;
  static const Color TEXTCOLORSUB = Color(0xFFA8A8A9);
  static const Color TEXTCOLORSUBLIGHT = Color(0xFF575757);
  static const Color HINTTEXT = Color(0xFFBBBBBB);
  static const Color HINTTEXTDARK = Color(0xFF676767);
  static const Color ICONCOLOR = Color(0xFFBBBBBB);
  static const Color ICONCOLORSEC = Color(0xFF626262);
  static const Color STARCOLOR = Color(0xFFEDB310);
  static const Color TEXTFEILDBORDERDARK = Color(0xFFA8A8A9);
  static const Color TEXTFEILDFILL = Color(0xFFF3F3F3);
  static const Color TEXTFEILDBORDERLIGHT = Color(0xFFC8C8C8);
  static const Color SIZECHARTRED = Color(0xFFFA7189);
  static const Color BLACK = Color(0xff0d0005);
  static const Color WHITE = Colors.white;
  static const Color LIGHTGREY = Color(0xFFC4C4C4);
  static const Color CONTAINERBLUE = Color(0xFF4392F9);
  static const Color TRANSPARENT = Colors.transparent;


  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.isEmpty) {
      return const Color(0xFF252525);
    } else {
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
  }





  static final ThemeData datePickerTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: WHITE,
      brightness: Brightness.light,
      onPrimary: WHITE,
      surface: WHITE,
      onSurface: BLACK,
      secondary: WHITE,
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
     
    ),
  );

  static List<BoxShadow> defshadow =  [
                                    BoxShadow(
                                        color: ColorResources.BLACK
                                            .withOpacity(0.3),
                                        blurRadius: paddingSmall)
                                  ];
  static List<BoxShadow> smallshadow =  [
                                    BoxShadow(
                                        color: ColorResources.BLACK
                                            .withOpacity(0.08),
                                            offset: Offset(1, 1),
                                        blurRadius: paddingLarge)
                                  ];
}

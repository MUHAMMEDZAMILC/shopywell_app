import 'package:flutter/material.dart';
import 'colors.dart';



class MyTheme {
  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: ColorResources.ICONCOLOR),
      backgroundColor: ColorResources.APPBARBG,
      surfaceTintColor: ColorResources.APPBARBG,
      shadowColor: ColorResources.APPBARBG,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: ColorResources.SCAFFOLDBG,
    iconTheme: IconThemeData(color: ColorResources.ICONCOLOR),
    primaryIconTheme: IconThemeData(color: ColorResources.ICONCOLOR),
    hintColor: ColorResources.HINTTEXT,
   
  );
}

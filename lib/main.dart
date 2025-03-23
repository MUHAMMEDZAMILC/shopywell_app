import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/view/app/shopywellapp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.TRANSPARENT, // Match AppBar color
      statusBarIconBrightness: Brightness.light, // Use light icons for dark background
    ));

  runApp(ShpoywellApp());
}
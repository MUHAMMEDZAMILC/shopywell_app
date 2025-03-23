// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppImageAsset extends StatelessWidget {
  final String assetName;
  final Color? color;
  final BoxFit fit;
  final double? width, height;
  final void Function()? onPressed;

  const AppImageAsset({
    super.key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.onPressed,
  });

  ///Click enabled SVG
  const AppImageAsset.clickable({
    super.key,
    required this.assetName,
    this.color,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) =>
      onPressed == null ? buildSvgPicture : InkWell(onTap: onPressed, child: buildSvgPicture);

  get buildSvgPicture =>
      Image.asset("assets/images/$assetName", fit: fit, width: width, height: height,color: color,);

}
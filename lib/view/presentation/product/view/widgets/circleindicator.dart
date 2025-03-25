import 'package:flutter/material.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';

class CircledotIndicator extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;

  const CircledotIndicator({
    super.key,
    required this.isActive,
    this.activeColor = ColorResources.PRIMARYCOLOR,
    this.inactiveColor = ColorResources.ICONCOLOR,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width:  8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
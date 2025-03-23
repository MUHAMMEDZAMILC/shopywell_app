import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/colors.dart';

class DotIndicator extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;

  const DotIndicator({
    super.key,
    required this.isActive,
    this.activeColor = ColorResources.BLACK,
    this.inactiveColor = ColorResources.LIGHTGREY,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
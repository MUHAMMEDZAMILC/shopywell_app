// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import '../../core/helper/pagenavigator.dart';
import 'apptext.dart';

class ApBarMn extends StatelessWidget implements PreferredSizeWidget {
  Widget? title;
  bool? titleonly = true, isback = false;
  String? titlename;
  Widget? leading;
  List<Widget>? actions;
  double? height;
  PreferredSizeWidget? bottom;
  ApBarMn(
      {super.key,
      this.titlename,
      this.title,
      this.titleonly,
      this.leading,
      this.actions,
      this.height,
      this.bottom,
      this.isback});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: ColorResources.TRANSPARENT,
      elevation: 0,
      titleSpacing: 10,
      flexibleSpace: Container(
        decoration: const BoxDecoration(),
      ),
      title: titleonly == true
          ? AppText(
              text: titlename ?? '',
              size: 18,
              letterspace: 0.1,
              weight: FontWeight.w500,
            )
          : title,
      leading: isback == true
          ? InkWell(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Screen.close(context);
              },
              child: Icon(
                CupertinoIcons.left_chevron,
                color: ColorResources.ICONCOLORSEC,
              ),
            )
          : leading,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}

class ApBarMnHmSc extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  Widget? leading;
  Widget? titlewidget;
  List<Widget>? actions;
  ApBarMnHmSc(
      {super.key, this.title, this.leading, this.actions, this.titlewidget});
  @override
  Widget build(BuildContext context) {
    return AppBar(
       shadowColor: ColorResources.TRANSPARENT,
        titleSpacing: 10,
        elevation: 0,
        title: titlewidget ?? Text(title ?? ''),
        leading: leading,
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

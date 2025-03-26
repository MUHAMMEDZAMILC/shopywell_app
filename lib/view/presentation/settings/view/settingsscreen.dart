// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/apptext.dart';

import '../../../../core/helper/help_screensize.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      child: Padding(
        padding: const EdgeInsets.all(paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text: 'Settings Screen')
          ],
        ),
      ),
    );
  }
}

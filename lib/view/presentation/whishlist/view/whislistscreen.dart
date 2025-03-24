import 'package:flutter/cupertino.dart';

import '../../../../core/helper/help_screensize.dart';

class WhishListScreen extends StatelessWidget {
  const WhishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('WhishList Screen'),
        ],
      ),
    );
  }
}
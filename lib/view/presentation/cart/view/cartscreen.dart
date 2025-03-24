import 'package:flutter/cupertino.dart';

import '../../../../core/helper/help_screensize.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Cart Screen'),
        ],
      ),
    );
  }
}
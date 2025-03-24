import 'package:flutter/cupertino.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Search Screen'),
        ],
      ),
    );
  }
}
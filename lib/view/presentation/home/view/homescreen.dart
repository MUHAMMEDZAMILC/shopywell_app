import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import '../../../../core/utils/theme/colors.dart';
import '../../../../core/utils/theme/dimensions.dart';
import '../../../components/apptext.dart';
import '../../../components/apptextfeild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: ApBarMn(

      ),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Column(
          children: [
            gap,
            gap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  paddingLarge),
              child: AppTextFeild(controller: searchCtrl,prefix: Icon(CupertinoIcons.search,color: ColorResources.ICONCOLOR,),hinttext: 'Saerch any Products',suffix: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(CupertinoIcons.mic,color: ColorResources.ICONCOLOR,),
              ),),
            ),
            gap,
            Row(
              children: [
                Expanded(child: AppText(text: 'All Featured',size: 18,weight: FontWeight.w600,)),
                Container(
                  decoration: BoxDecoration(
                    color: ColorResources.WHITE
                  ),
                  child: Row(
                  children: [
                    AppText(text: 'Sort'),
                    Icon(Icons.compare_arrows,color: ColorResources.BLACK,)
                  ],
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
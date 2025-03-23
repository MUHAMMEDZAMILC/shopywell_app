
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appimageassets.dart';
import 'package:shopywell_app/view/components/appsvg.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: ApBarMnHmSc(leading:   Padding(
        padding: const EdgeInsets.only(left:  16.0),
        child: AppSvg(assetName: draweric),
      ),titlewidget: AppImageAsset(assetName: appbarlogo),),
      // body: 
      bottomNavigationBar: SizedBox(
        height: 76,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            BottomNavigationBar(
              
              type: BottomNavigationBarType.fixed,
              backgroundColor: ColorResources.WHITE,
              fixedColor: ColorResources.PRIMARYCOLOR,
              
              selectedIconTheme: IconThemeData(color: ColorResources.PRIMARYCOLOR),
              unselectedIconTheme: IconThemeData(color: ColorResources.BLACK),
              selectedLabelStyle: TextStyle(
                color: ColorResources.PRIMARYCOLOR,
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),
              // selectedItemColor: ColorResources.PRIMARYCOLOR,
              unselectedItemColor: ColorResources.BLACK,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedLabelStyle: TextStyle(
                color: ColorResources.BLACK,
                fontSize: 12,
                fontFamily: 'Montserrat'
              ),
              items: [
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.house),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart),label: 'WhishList'),
              BottomNavigationBarItem(icon: 10.hBox,label: ''),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: 'Search'),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),label: 'Settings'),
            ]),
            Positioned(
              top: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorResources.WHITE,
                  boxShadow: ColorResources.defshadow

                ),
                child: Icon(CupertinoIcons.cart,color: ColorResources.BLACK,),
              ))
          ],
        ),
      ),
    );
  }
}
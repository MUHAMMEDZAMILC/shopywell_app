
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/helper/help_loader.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/utils/extension/space_ext.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appimageassets.dart';
import 'package:shopywell_app/view/components/appsvg.dart';

import '../viewmodel/bloc/landing_bloc.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    context.read<LandingBloc>().add(LandingInitialEvent(0));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: ApBarMnHmSc(leading:   Padding(
        padding: const EdgeInsets.only(left:  16.0),
        child: AppSvg(assetName: draweric),
      ),titlewidget: AppImageAsset(assetName: appbarlogo),),
      body: BlocBuilder<LandingBloc,LandingState>(builder: (context, state) {
       if(state.status == LandingStatus.initial) return PageEntryLoader();
          return state.pages.elementAt(state.currentIndex);
       
      }),
      bottomNavigationBar: SizedBox(
        height: 76,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            BottomNavigationBar(
              currentIndex: context.watch<LandingBloc>().state.currentIndex,
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
            ],onTap: (value) {
              context.read<LandingBloc>().add(ChangeIndexEvent(value));
            },),
            Positioned(
              top: 0,
              child: GestureDetector(
                onTap: () {
                  context.read<LandingBloc>().add(ChangeIndexEvent(2));
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:context.watch<LandingBloc>().state.currentIndex==2?ColorResources.PRIMARYCOLOR: ColorResources.WHITE,
                    boxShadow: ColorResources.defshadow
                
                  ),
                  child: Icon(CupertinoIcons.cart,color:context.watch<LandingBloc>().state.currentIndex==2?ColorResources.WHITE: ColorResources.BLACK,),
                ),
              ))
          ],
        ),
      ),
    );
  }
}
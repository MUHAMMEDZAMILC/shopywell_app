// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/controller/sharedpreference/sharedpreferance.dart';
import 'package:shopywell_app/core/globalvariables.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/view/presentation/signin/view/loginscreen.dart';
import '../../view/components/apptext.dart';
logout(BuildContext context) async {
  showDialog(
      context: context,
      builder: (builder) => CupertinoAlertDialog(
        insetAnimationCurve: Curves.linear,
            title:  AppText( text:'Are You Sure to Logout',textalign: TextAlign.center,),
            actions: [
              CupertinoButton(
                  child:  AppText( text:'No'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              CupertinoButton(
                  child: AppText( text:'Logout'),
                  onPressed: () async {
                    await SharedPreferance.pref?.remove(useridkey);
                   
                   Screen.openAsNewPage(context, LoginScreen());
                  })
            ],
          ));
}

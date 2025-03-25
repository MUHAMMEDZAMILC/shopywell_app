import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/view/components/appimageassets.dart';
import 'package:shopywell_app/view/presentation/splash/viewmodel/bloc/splash_bloc.dart';
import 'package:shopywell_app/viewmodel/firebase/bloc/firebase_bloc.dart';

import '../../../../core/helper/help_screensize.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    getdata();
    super.initState();
  }
  getdata() async {
    context.read<FirebaseBloc>().add(FirebaseInitialEvent());
    context.read<SplashBloc>().add(SplashInitialEvent(context));
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImageAsset(assetName: 'splogo.png',)
          ],
        ),
      ),
    );
  }
}
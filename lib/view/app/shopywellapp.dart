import 'package:flutter/material.dart';
import 'package:shopywell_app/core/constants/appcontants/appconstants.dart';
import 'package:shopywell_app/core/utils/theme/theme_data.dart';
import 'package:shopywell_app/view/presentation/landing/viewmodel/bloc/landing_bloc.dart';
import 'package:shopywell_app/view/presentation/onboard/viewmodel/bloc/onboard_bloc.dart';
import 'package:shopywell_app/view/presentation/splash/view/splashscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/view/presentation/splash/viewmodel/bloc/splash_bloc.dart';

class ShpoywellApp extends StatelessWidget {
  const ShpoywellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc(),),
        BlocProvider(create: (context) => OnboardBloc(),),
        BlocProvider(create: (context) => LandingBloc(),),
      ],
      child: MaterialApp(
        title: AppConstants.appname,
        debugShowCheckedModeBanner: false,
        theme: MyTheme.theme,
        home: SplasScreen(),
      ),
    );
  }
}
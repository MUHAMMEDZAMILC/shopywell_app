// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/view/presentation/getstart/view/getstart.dart';
import 'package:shopywell_app/view/presentation/landing/view/landingscreen.dart';
import 'package:shopywell_app/view/presentation/onboard/view/onboardscreen.dart';
import 'package:shopywell_app/view/presentation/onboard/viewmodel/bloc/onboard_bloc.dart';

import '../../../signin/viewmodel/bloc/login_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent>(_splashInit);
  }

  // Event handler for SplashInitialEvent
  void _splashInit(SplashInitialEvent event, Emitter<SplashState> emit) async {
    Future.delayed(const Duration(seconds: 2), () async {
      event.context.read<LoginBloc>().add(CheckalreadyloginEvent());

      event.context
          .read<LoginBloc>()
          .stream
          .firstWhere((state) => state.status == LoginStatus.success)
          .then((value) {
            if (value.islogin) {
              Screen.openAsNewPage(event.context, LandingScreen());
            } else {
              event.context.read<OnboardBloc>().add(CheckonboardEvent());
              event.context
                  .read<OnboardBloc>()
                  .stream
                  .firstWhere((state) => state.status == OnboardStatus.success)
                  .then((value) {
                    if (value.ischecked) {
                      Screen.openClosingCurrentPage(
                        event.context,
                        GetStartScreen(),
                      );
                    } else {
                      Screen.openClosingCurrentPage(
                        event.context,
                        OnboardScreen(),
                      );
                    }
                  });
            }
          });
    });
  }
}

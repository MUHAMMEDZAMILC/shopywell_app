import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/view/presentation/onboard/view/onboardscreen.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
  
    on<SplashInitialEvent>(_splashInit);
  }

  // Event handler for SplashInitialEvent
  void _splashInit(SplashInitialEvent event, Emitter<SplashState> emit) {
    Timer(const Duration(seconds: 3), () {
      Screen.openAsNewPage(event.context, OnboardScreen());
    });
  }
}

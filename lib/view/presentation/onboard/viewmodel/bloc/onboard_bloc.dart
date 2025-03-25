import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopywell_app/controller/sharedpreference/sharedpreferance.dart';
import 'package:shopywell_app/core/constants/strings.dart';
import 'package:shopywell_app/core/globalvariables.dart';
import 'package:shopywell_app/view/presentation/getstart/view/getstart.dart';

import '../../../../../core/helper/pagenavigator.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc()
    : super(
        OnboardState(
          status: OnboardStatus.initial,
          onboardingData: [],
          currentindex: 0,
        ),
      ) {
    on<OnboardInitEvent>(oneventinit);
    on<CheckonboardEvent>(checkonboard);
    on<OnboardPageChangeEvent>(onboardpagechnage);
    on<OnboardskipEvent>(onboardskip);
    on<OnboardnextEvent>(onboardnext);
  }

  List<Map<String, String>> onboardingData = [
    {
      "img": boardone,
      "title": "Choose Products",
      "description":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    },
    {
      "img": boardtwo,
      "title": "Make Payment",
      "description":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    },
    {
      "img": boardthree,
      "title": "Get Your Order",
      "description":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    },
  ];
  int currentindex = 0;

  oneventinit(OnboardInitEvent event, Emitter<OnboardState> emit) {
    emit(
      OnboardState(
        status: OnboardStatus.initial,
        currentindex: currentindex,
        onboardingData: onboardingData,
      ),
    );
  }

  onboardpagechnage(OnboardPageChangeEvent event, Emitter<OnboardState> emit) {
    currentindex = event.page;
    try {
      emit(
        OnboardState(
          status: OnboardStatus.changedpage,
          currentindex: currentindex,
          onboardingData: onboardingData,
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  onboardskip(OnboardskipEvent event, Emitter<OnboardState> emit) {
    emit(
      OnboardState(
        status: OnboardStatus.skip,
        currentindex: 0,
        onboardingData: onboardingData,
      ),
    );
    Screen.openAsNewPage(event.context, GetStartScreen());
  }

  onboardnext(OnboardnextEvent event, Emitter<OnboardState> emit) {
    if (currentindex < onboardingData.length - 1) {
      emit(
        OnboardState(
          status: OnboardStatus.next,
          currentindex: currentindex,
          onboardingData: onboardingData,
        ),
      );
      event.controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      emit(
        OnboardState(
          status: OnboardStatus.skip,
          currentindex: 0,
          onboardingData: onboardingData,
        ),
      );
      Screen.openAsNewPage(event.context, GetStartScreen());
    }
  }

  FutureOr<void> checkonboard(
    CheckonboardEvent event,
    Emitter<OnboardState> emit,
  ) async {
    try {
      emit(OnboardState(
            ischecked: false,
            status: OnboardStatus.initial,
            onboardingData: onboardingData,
            currentindex: currentindex,
          ));
      bool? isonboard = await SharedPreferance.getbool(onboardkey);
      log(isonboard.toString());
      if (isonboard != null && isonboard == true) {
        emit(
          OnboardState(
            ischecked: true,
            status: OnboardStatus.success,
            onboardingData: onboardingData,
            currentindex: currentindex,
          ),
        );
      } else {
        emit(
          OnboardState(
            ischecked: false,
            status: OnboardStatus.success,
            onboardingData: onboardingData,
            currentindex: currentindex,
          ),
        );
      }
    } catch (e) {
      emit(
        OnboardState(
          ischecked: false,
          status: OnboardStatus.success,
          onboardingData: onboardingData,
          currentindex: currentindex,
        ),
      );
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopywell_app/view/presentation/home/view/homescreen.dart';
import 'package:shopywell_app/view/presentation/search/view/searchscreen.dart';
import 'package:shopywell_app/view/presentation/settings/view/settingsscreen.dart';
import 'package:shopywell_app/view/presentation/whishlist/view/whislistscreen.dart';

import '../../../cart/view/cartscreen.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingState(status: LandingStatus.initial,currentIndex: 0, pages: [])) {
    on<LandingInitialEvent>(landinginit);
    on<ChangeIndexEvent>(chnageindex);
  }

  Stream<LandingState> mapEventToState(LandingEvent event) async* {}
  List pages = [
    HomeScreen(),
    WhishListScreen(),
    CartScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  landinginit(LandingInitialEvent event, Emitter<LandingState> emit) async {
    // emit(
    //   LandingState(
    //     status: LandingStatus.initial,
    //     currentIndex: 0,
    //     pages: pages,
    //   ),
    // );
    emit(
      LandingState(status: LandingStatus.loaded, currentIndex: 0, pages: pages),
    );
  }

  chnageindex(ChangeIndexEvent event, Emitter<LandingState> emit) {
    emit(
      LandingState(
        status: LandingStatus.loaded,
        currentIndex: event.currentIndex,
        pages: pages,
      ),
    );
  }
}

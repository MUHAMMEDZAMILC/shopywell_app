import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopywell_app/core/constants/appcontants/appconstants.dart';

part 'firebase_event.dart';
part 'firebase_state.dart';

class FirebaseBloc extends Bloc<FirebaseEvent, FirebaseState> {
  FirebaseBloc() : super(FirebaseInitial()){
    on<FirebaseInitialEvent>(firebaseinit);
  }

  @override
  Stream<FirebaseState> mapEventToState(
    FirebaseEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }

  FutureOr<void> firebaseinit(FirebaseInitialEvent event, Emitter<FirebaseState> emit)async {
    try{
      emit(FirebaseInitial());
       await Firebase.initializeApp(
        name: AppConstants.appname,
        options: FirebaseOptions(appId: AppConstants.firebaseappid,
          apiKey: AppConstants.firebasekey,
          messagingSenderId: AppConstants.firebsesenderid,
          projectId: AppConstants.firebaseprojectid,)
       );
       emit(Fireseloaded());
    }catch(e){
      emit(FirebaseError());
      log(e.toString());
    }
      }
}

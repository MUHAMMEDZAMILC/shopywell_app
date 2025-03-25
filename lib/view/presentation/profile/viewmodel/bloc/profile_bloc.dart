// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/core/helper/help_toast.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/view/presentation/signin/viewmodel/bloc/login_bloc.dart';
import 'package:shopywell_app/view/presentation/signup/model/user_model.dart';

import '../../../../../core/globalvariables.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState(status: ProfileStatus.initlize)) {
    on<ProfileInitEvent>(profileinit);
    on<ProfileeditEvent>(profileedit);
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {

  }

  profileinit(ProfileInitEvent event, Emitter<ProfileState> emit) async {
    UserData? user;
    emit(ProfileState(status: ProfileStatus.loading, userdata: user));
    try {
      DocumentSnapshot document =
          await FirebaseFirestore.instance
              .collection(usercollection)
              .doc(event.context.read<LoginBloc>().state.userid)
              .get();

      if (document.exists) {
        log(document.data().toString());
        user = UserData.fromJson(document.data() as Map<String, dynamic>);

        emit(ProfileState(status: ProfileStatus.loaded, userdata: user));
      } else {
        emit(ProfileState(status: ProfileStatus.loaded, userdata: user));
      }
    } catch (e) {
      emit(ProfileState(status: ProfileStatus.error, userdata: user));
    }
  }



   profileedit(ProfileeditEvent event, Emitter<ProfileState> emit) async{
    try {
      emit(ProfileState(status: ProfileStatus.btnloading,),);
      await FirebaseFirestore.instance.collection(usercollection).doc(event.context.read<LoginBloc>().state.userid).update(event.userdata.toJson());
      emit(ProfileState(status: ProfileStatus.btnsuccess,userdata: event.userdata));
      snackBar(event.context, message: 'Profile Update',type: MessageType.success);
      Screen.close(event.context);
    } catch (e) {
      log(e.toString());
      snackBar(event.context, message: 'Failed Profile Update');
      emit(ProfileState(status: ProfileStatus.btnerror,userdata: event.userdata));
    }
  }
}

// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopywell_app/core/globalvariables.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/view/presentation/landing/view/landingscreen.dart';
import 'package:shopywell_app/view/presentation/signup/model/user_model.dart';

import '../../../../../controller/sharedpreference/sharedpreferance.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(status: LoginStatus.initial)) {
    on<CheckalreadyloginEvent>(checklogin);
    on<LoginuserEvent>(loginuser);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

  }

  FutureOr<void> checklogin(
    CheckalreadyloginEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginState(islogin: false, status: LoginStatus.initial));
      String? userid = await SharedPreferance.getstring(useridkey);
      log(userid.toString());
      if (userid != null) {
        emit(
          LoginState(
            islogin: true,
            userid: userid,
            status: LoginStatus.success,
          ),
        );
       
      } else {
        emit(LoginState(islogin: false, status: LoginStatus.success));
      }
    } catch (e) {
      emit(LoginState(islogin: false, status: LoginStatus.success));
    }
  }

  FutureOr<void> loginuser(
    LoginuserEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginState(islogin: false, status: LoginStatus.loding));
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: event.data.email ?? '',
            password: event.data.password ?? '',
          );
      event.data.uid = userCredential.user?.uid;
      DocumentSnapshot document =
          await FirebaseFirestore.instance
              .collection(usercollection)
              .doc(userCredential.user?.uid)
              .get();
      UserData? user;
      if (document.exists) {
        log(document.data().toString());
        user = UserData.fromJson(document.data() as Map<String, dynamic>);
        await SharedPreferance.save(key: useridkey, value: user.uid);
        emit(LoginState(status: LoginStatus.success, userid: user.uid));
         Screen.openAsNewPage(event.context, LandingScreen());
      } else {
        log('Login Failed');
        emit(LoginState(status: LoginStatus.error));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginState(status: LoginStatus.error));
    } catch (e) {
      log('Login Failed $e');
      emit(LoginState(status: LoginStatus.error));
    }
  }
}

// ignore_for_file: use_build_context_synchronously, override_on_non_overriding_member

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/controller/sharedpreference/sharedpreferance.dart';
import 'package:shopywell_app/core/helper/pagenavigator.dart';
import 'package:shopywell_app/view/presentation/landing/view/landingscreen.dart';
import 'package:shopywell_app/view/presentation/signin/viewmodel/bloc/login_bloc.dart';
import 'package:shopywell_app/view/presentation/signup/model/user_model.dart';

import '../../../../../core/globalvariables.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState(status: RegisterStatus.initiize)) {
    on<RegisterUserEvent>(registeruser);
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    
  }

  FutureOr<void> registeruser(
    RegisterUserEvent event,
    Emitter<RegisterState> emit,
  ) async {
    

      try {
         emit(RegisterState(status: RegisterStatus.loading)); // Loading state
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: event.data.email ?? '',
              password: event.data.password ?? '',
            );

        // 2. Save UID to event.data
        event.data.uid = userCredential.user?.uid;

        // 3. Save user data to Firestore
        await FirebaseFirestore.instance
            .collection(usercollection)
            .doc(userCredential.user?.uid)
            .set(event.data.toJson());

        // 4. Save UID to SharedPreferences
        await SharedPreferance.save(key: useridkey, value: event.data.uid);

        emit(
          RegisterState(
            status: RegisterStatus.success,
            mesg: 'Registration Successful',
          ),
        );
         event.context.read<LoginBloc>().add(CheckalreadyloginEvent());
        Screen.openAsNewPage(event.context, LandingScreen());
      } on FirebaseAuthException catch (e) {
        emit(
          RegisterState(
            status: RegisterStatus.error,
            mesg: e.message ?? 'Registration Failed',
          ),
        );
      } catch (e) {
        emit(
          RegisterState(
            status: RegisterStatus.error,
            mesg: 'Registration Failed',
          ),
        );
      }
    
  }
}

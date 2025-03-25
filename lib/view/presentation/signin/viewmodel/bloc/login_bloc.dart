import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopywell_app/core/globalvariables.dart';

import '../../../../../controller/sharedpreference/sharedpreferance.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(status: LoginStatus.initial)) {
    on<CheckalreadyloginEvent>(checklogin);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: implement mapEventToState
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
        emit(LoginState(islogin: true,userid: userid, status: LoginStatus.success));
      } else {
        emit(LoginState(islogin: false, status: LoginStatus.success));
      }
    } catch (e) {
      emit(LoginState(islogin: false, status: LoginStatus.success));
    }
  }
}

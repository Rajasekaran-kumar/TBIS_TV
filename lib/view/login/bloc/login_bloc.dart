import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/login_model.dart';
import '../../../repo/service_repo.dart';
import '../../../tbis_core/model/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<PostLoginEvent>((event, emit) => _postLoginEvent(event, emit));
  }

  Future<void> _postLoginEvent(
      PostLoginEvent event, Emitter<LoginState> emit) async {
    try {
      Meta m =
          await ServiceRepository().postLoginService(userData: event.loginData);
      if (m.statusCode == 200) {
        if (m.response["isSuccess"] == true) {
          emit(
            OnLoginSuccess(
                loginResp: LoginModel.fromJson(m.response["result"])),
          );
        } else {
          emit(OnFailure(
              error: m.response["message"], timeStamp: DateTime.now().toString()));
        }
      } else {
        emit(OnFailure(
            error: m.statusMsg, timeStamp: DateTime.now().toString()));
      }
    } catch (error) {
      emit(OnFailure(
          error: error.toString(), timeStamp: DateTime.now().toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:thimar_app/core/server_gate.dart';

import '../../../../core/end_points.dart';
import '../../../../core/toast.dart';
import '../../../../generated/locale_keys.g.dart';

part 'events.dart';
part 'states.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvents, ChangePasswordStates> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  ServerGate serverGate = ServerGate();
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePasswordStartState>(_postData);
  }
  clearFields() {
    confirmPasswordController.clear();
    passwordController.clear();
  }

  unfocus(BuildContext context) {
    var currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  _postData(ChangePasswordStartState event,
      Emitter<ChangePasswordStates> emit) async {
    emit((ChangePasswordLoadingState()));
    CustomResponse response =
        await serverGate.sendToServer(url: changePasswordEndPoint, body: {
      'password': passwordController.text.trim(),
      'code': event.code,
      'phone': '966' + event.phone,
    });
    if (response.success) {
      emit(ChangePasswordSucessState());
    } else {
      emit(ChangePasswordFailState(
        error: response.msg,
      ));
    }
  }

  bool isDataVaild(context) {
    if (passwordController.text.trim().isNotEmpty) {
      if (confirmPasswordController.text.trim().isNotEmpty) {
        if (passwordController.text.trim() ==
            confirmPasswordController.text.trim()) {
          return true;
        } else {
          Toast.show(LocaleKeys.passwordsNotMatched.tr(), context);
          return false;
        }
      } else {
        Toast.show(LocaleKeys.PleaseWriteYourConfirmPassword.tr(), context);
        return false;
      }
    } else {
      Toast.show(LocaleKeys.PleaseWriteYourPassword.tr(), context);
      return false;
    }
  }
}

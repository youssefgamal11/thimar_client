import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:thimar_app/core/server_gate.dart';

import '../../../../core/end_points.dart';

part 'events.dart';
part 'states.dart';

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvents, ConfirmCodeStates> {
  ServerGate serverGate = ServerGate();
  late String? codeNumber;
  bool isComplete = false;
  late String phoneNumber;

  ConfirmCodeBloc() : super(ConfirmCodeInitialState()) {
    on<ConfirmCodeStartEvent>(_postData);
    on<ResendCodeStartEvent>(_resendCode);
  }

  unfocus(BuildContext context) {
    var currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  _postData(
      ConfirmCodeStartEvent event, Emitter<ConfirmCodeStates> emit) async {
    emit(ConfirmCodeLoadingState());
    phoneNumber = event.phone;
    CustomResponse response =
        await serverGate.sendToServer(url: forgetPasswordEndPoint2, body: {
      'phone': '966' + event.phone,
    });
    if (response.success) {
      emit(ConfirmCodeSucessState());
    } else {
      emit(ConfirmCodeFailState(
        error: response.msg,
      ));
    }
  }

  _resendCode(
      ResendCodeStartEvent event, Emitter<ConfirmCodeStates> emit) async {
    emit(ResendCodeLoadingState());
    CustomResponse response =
        await serverGate.sendToServer(url: forgetPasswordEndPoint, body: {
      'phone': '966' + event.phone,
    });
    if (response.success) {
      emit(ResendCodeSucessState());
    } else {
      emit(ResendCodeFailState(
        error: response.msg,
      ));
    }
  }
}

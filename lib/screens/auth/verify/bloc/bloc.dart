import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:thimar_app/core/server_gate.dart';

import '../../../../core/end_points.dart';

part 'event.dart';
part 'states.dart';

class VerifyBloc extends Bloc<VerifyEvents, VerifyStates> {
  ServerGate serverGate = ServerGate();
  late String? codeNumber;
  bool isComplete = false;
  // final baseUrl = 'https://thimar.amr.aait-d.com/public/api/';

  VerifyBloc() : super(VerifyInitial()) {
    on<VerifyEventStart>(_postData);
    on<ResendCodeEventStart>(_resendCode);
  }

  _postData(VerifyEventStart event, Emitter<VerifyStates> emit) async {
    emit(VerifyLoadingState());
    CustomResponse response =
        await serverGate.sendToServer(url: confirmCodeEndPoint, body: {
      'code': codeNumber,
      'phone': '966' + event.phone,
      'device_token': 'DEVICE_TOKEN',
      'type': Platform.isAndroid ? 'android' : 'ios',
    });
    if (response.success) {
      emit(VerifySuccessState());
    } else {
      emit(VerifyFailState(
        error: response.msg,
      ));
    }
  }

  _resendCode(ResendCodeEventStart event, Emitter<VerifyStates> emit) async {
    emit(ResendCodeLoadingState());
    CustomResponse response =
        await serverGate.sendToServer(url: forgetPasswordEndPoint, body: {
      'phone': '966' + event.phone,
    });
    if (response.success) {
      emit(ResendCodeSuccessState());
    } else {
      emit(ResendCodeFailState(
        error: response.msg,
      ));
    }
  }
}

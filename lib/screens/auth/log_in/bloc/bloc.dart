import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:thimar_app/core/server_gate.dart';
import 'package:thimar_app/screens/auth/login/bloc/model.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/end_points.dart';
import '../../../../core/firebase_notification.dart';
import '../../../../core/toast.dart';
import '../../../../generated/locale_keys.g.dart';

part 'events.dart';
part 'states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  ServerGate serverGate = ServerGate();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  LoginBloc() : super(LoginInitialState()) {
    on<LoginEventStart>(_postData);
  }

  void init() async {
    await GlobalNotification.getFcmToken().then((value) {
      // print(value);
      CacheHelper.setDeviceToken(value);
    });
  }

  clearFields() {
    phoneController.clear();
    passwordController.clear();
  }

  unfocus(BuildContext context) {
    var currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  bool isDataVaild(context) {
    if (phoneController.text.trim().isNotEmpty) {
      if (passwordController.text.trim().isNotEmpty) {
      } else {
        Toast.show(LocaleKeys.PleaseWriteYourPassword.tr(), context);
        return false;
      }
    } else {
      Toast.show(LocaleKeys.PleaseWriteYourPhoneNumber.tr(), context);
      return false;
    }
    return true;
  }

  _postData(LoginEventStart event, Emitter<LoginStates> emit) async {
    emit(LoginLoadingState());
    CustomResponse response = await serverGate.sendToServer(
      url: loginEndPoint,
      body: {
        'phone': '966' + phoneController.text.trim(),
        'password': passwordController.text.trim(),
        'device_token': CacheHelper.getDeviceToken(),
        'type': Platform.isAndroid ? 'android' : 'ios',
        'user_type': 'client',
      },
    );
    if (response.success) {
      emit(LoginSucessState());

      final model = LoginModel.fromJson(response.response!.data).data;
      CacheHelper.setName(model!.fullname!);
      CacheHelper.setImage(model.image!);
      CacheHelper.setCityId(model.city!.id!);
      CacheHelper.setPhone(model.phone!);
      CacheHelper.setUserToken(model.token!);
    } else {
      emit(LoginFailState(
        error: response.msg.toString(),
      ));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:thimar_app/core/end_points.dart';
import 'package:thimar_app/core/server_gate.dart';
import 'package:thimar_app/screens/auth/signup/bloc/model.dart';

import '../../../../core/toast.dart';
import '../../../../generated/locale_keys.g.dart';

part 'events.dart';
part 'states.dart';

class SignupBloc extends Bloc<SignupEvents, SignupState> {
  ServerGate serverGate = ServerGate();

  String? cityId;
  String? cityName;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignupBloc() : super(SignupInitial()) {
    on<SignUpGetCitiesEventStart>(_getCitiesData);
    on<SignUpEventStart>(_postData);
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
    if (nameController.text.trim().isNotEmpty) {
      if (phoneController.text.trim().isNotEmpty) {
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
      } else {
        Toast.show(LocaleKeys.PleaseWriteYourPhoneNumber.tr(), context);
        return false;
      }
    } else {
      Toast.show(LocaleKeys.PleaseWriteYourName.tr(), context);
      return false;
    }
  }

  void _getCitiesData(
      SignUpGetCitiesEventStart event, Emitter<SignupState> emit) async {
    emit(SignUpGetCitiesLoadingState());
    CustomResponse response = await serverGate.getFromServer(
      url: showCitiesEndPoint + '1',
    );
    if (response.success) {
      final model = CityDataModel.fromJson(response.response!.data);
      emit(SignUpGetCitiesSucessState(model: model));
    } else {
      emit(SignUpGetCitiesFailState(error: response.msg.toString()));
    }
  }

  void _postData(SignUpEventStart event, Emitter<SignupState> emit) async {
    emit(SignUpLoadingState());
    String phone = phoneController.text.trim();
    if (phone.startsWith('0')) {
      phone = phone.substring(1);
    }
    CustomResponse response =
        await serverGate.sendToServer(url: registerEndPoint, body: {
      'fullname': nameController.text.trim(),
      'password': passwordController.text.trim(),
      'phone': '966' + phone,
      'password_confirmation': confirmPasswordController.text,
      'city_id': cityId,
      'country_id': 1,
    });
    if (response.success) {
      emit(SignUpSucessState());
    } else {
      emit(SignUpFailState(error: response.msg.toString()));
    }
  }
}

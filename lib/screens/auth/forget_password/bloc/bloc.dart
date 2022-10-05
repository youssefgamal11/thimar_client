import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:thimar_app/core/end_points.dart';
import 'package:thimar_app/core/server_gate.dart';

part 'events.dart';
part 'states.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordStates> {
  ServerGate serverGate = ServerGate();
  late var phoneNumber = TextEditingController();

  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordStartEvent>(_postData);
  }

  unfocus({required BuildContext context}) {
    var currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  _postData(ForgetPasswordStartEvent event,
      Emitter<ForgetPasswordStates> emit) async {
    emit(ForgetPasswordLoadingState());
    CustomResponse response =
        await serverGate.sendToServer(url: forgetPasswordEndPoint2, body: {
      'phone': '966' + phoneNumber.text.trim(),
    });
    if (response.success) {
      emit(ForgetPasswordSuccessState());
    } else {
      emit(ForgetPasswordFailState(
        error: response.msg,
      ));
    }
  }
}

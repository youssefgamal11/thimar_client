import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/screens/auth/confirm_code/bloc/bloc.dart';
import 'package:thimar_app/screens/auth/forget_password/bloc/bloc.dart';
import 'package:thimar_app/screens/home/pages/main/bloc/bloc.dart';

import '../screens/auth/change_password/bloc/bloc.dart';
import '../screens/auth/login/bloc/bloc.dart';
import '../screens/auth/signup/bloc/bloc.dart';
import '../screens/auth/verify/bloc/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((container) => SignupBloc());
  container.registerFactory((container) => VerifyBloc());
  container.registerFactory((container) => LoginBloc());
  container.registerFactory((container) => ForgetPasswordBloc());
  container.registerFactory((container) => ConfirmCodeBloc());
  container.registerFactory((container) => ChangePasswordBloc());
  container.registerFactory((container) => MainBloc());
}

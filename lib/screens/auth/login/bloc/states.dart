part of 'bloc.dart';

@immutable
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginFailState extends LoginStates {
  final String? error;
  LoginFailState({this.error});
}

class LoginSucessState extends LoginStates {}

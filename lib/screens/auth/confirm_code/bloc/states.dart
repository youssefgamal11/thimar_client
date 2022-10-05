part of 'bloc.dart';

@immutable
abstract class ConfirmCodeStates {}

class ConfirmCodeInitialState extends ConfirmCodeStates {}

class ConfirmCodeLoadingState extends ConfirmCodeStates {}

class ConfirmCodeSucessState extends ConfirmCodeStates {}

class ConfirmCodeFailState extends ConfirmCodeStates {
  final String? error;
  ConfirmCodeFailState({this.error});
}

class ResendCodeLoadingState extends ConfirmCodeStates {}

class ResendCodeSucessState extends ConfirmCodeStates {}

class ResendCodeFailState extends ConfirmCodeStates {
  final String? error;
  ResendCodeFailState({this.error});
}

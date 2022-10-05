part of 'bloc.dart';

@immutable
abstract class VerifyStates {}

class VerifyInitial extends VerifyStates {}

class VerifyLoadingState extends VerifyStates {}

class VerifySuccessState extends VerifyStates {}

class VerifyFailState extends VerifyStates {
  final String? error;
  VerifyFailState({this.error});
}

class ResendCodeLoadingState extends VerifyStates {}

class ResendCodeSuccessState extends VerifyStates {}

class ResendCodeFailState extends VerifyStates {
  final String? error;
  ResendCodeFailState({this.error});
}

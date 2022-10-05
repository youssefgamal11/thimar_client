part of 'bloc.dart';

@immutable
abstract class ForgetPasswordStates {}

class ForgetPasswordInitial extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {}

class ForgetPasswordSuccessState extends ForgetPasswordStates {}

class ForgetPasswordFailState extends ForgetPasswordStates {
  final String? error;
  ForgetPasswordFailState({this.error});
}

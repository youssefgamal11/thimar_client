part of 'bloc.dart';

class ChangePasswordStates {}

class ChangePasswordInitial extends ChangePasswordStates {}

class ChangePasswordLoadingState extends ChangePasswordStates {}

class ChangePasswordSucessState extends ChangePasswordStates {}

class ChangePasswordFailState extends ChangePasswordStates {
  final String? error;
  ChangePasswordFailState({this.error});
}

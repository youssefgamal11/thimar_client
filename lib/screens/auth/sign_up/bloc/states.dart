part of 'bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignUpLoadingState extends SignupState {}

class SignUpSucessState extends SignupState {}

class SignUpFailState extends SignupState {
  final String? error;
  SignUpFailState({this.error});
}

class SignUpGetCitiesLoadingState extends SignupState {}

class SignUpGetCitiesSucessState extends SignupState {
  final CityDataModel model;
  SignUpGetCitiesSucessState({required this.model});
}

class SignUpGetCitiesFailState extends SignupState {
  final String? error;
  SignUpGetCitiesFailState({this.error});
}

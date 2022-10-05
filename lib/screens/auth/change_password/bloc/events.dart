part of 'bloc.dart';

@immutable
abstract class ChangePasswordEvents {}

class ChangePasswordStartState extends ChangePasswordEvents {
  final String code;
  final String phone;
  ChangePasswordStartState({required this.code, required this.phone});
}

part of 'bloc.dart';

@immutable
abstract class VerifyEvents {}

class VerifyEventStart extends VerifyEvents {
  final String phone;
  VerifyEventStart({required this.phone});
}

class ResendCodeEventStart extends VerifyEvents {
  final String phone;
  ResendCodeEventStart({required this.phone});
}

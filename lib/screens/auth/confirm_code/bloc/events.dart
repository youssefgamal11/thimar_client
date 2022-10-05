part of 'bloc.dart';

@immutable
abstract class ConfirmCodeEvents {}

class ConfirmCodeStartEvent extends ConfirmCodeEvents {
  final String phone;
  ConfirmCodeStartEvent({required this.phone});
}

class ResendCodeStartEvent extends ConfirmCodeEvents {
  final String phone;
  ResendCodeStartEvent({required this.phone});
}

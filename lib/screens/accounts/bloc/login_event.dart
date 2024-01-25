part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class InitEvent extends LoginEvent {
  const InitEvent();
}

class EmailChangedEvent extends LoginEvent {
  final LoginFormFieldModal email;
  const EmailChangedEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordChangedEvent extends LoginEvent {
  final LoginFormFieldModal password;
  const PasswordChangedEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

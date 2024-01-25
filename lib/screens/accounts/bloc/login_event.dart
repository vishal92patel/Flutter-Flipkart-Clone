part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginInitEvent extends LoginEvent {
  const LoginInitEvent();
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

class SignInEvent extends LoginEvent {
  final String email;
  final String password;
  const SignInEvent({required this.email, required this.password});
}

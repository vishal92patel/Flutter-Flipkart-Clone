part of 'login_bloc.dart';

class LoginState extends Equatable {
  final LoginFormFieldModal email;
  final LoginFormFieldModal password;

  const LoginState({required this.email, required this.password});

  LoginState copyWith({
    LoginFormFieldModal? email,
    LoginFormFieldModal? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [email, password];
}

part of 'login_bloc.dart';

class LoginState extends Equatable {
  final LoginFormFieldModal email;
  final LoginFormFieldModal password;
  final bool? isLoading;
  final bool? isSuccess;
  final bool? isFail;
  final String failResponse;

  const LoginState({
    required this.email,
    required this.password,
    this.isLoading = false,
    this.isSuccess = false,
    this.isFail = false,
    this.failResponse = '',
  });

  LoginState copyWith({
    LoginFormFieldModal? email,
    LoginFormFieldModal? password,
    bool? isLoading,
    bool? isSuccess,
    bool? isFail,
    String? failResponse,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFail: isFail ?? this.isFail,
      failResponse: failResponse ?? this.failResponse,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        isLoading,
        isSuccess,
        isFail,
        failResponse,
      ];
}

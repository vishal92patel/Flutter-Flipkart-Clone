import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modal/login_form_field_modal.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(LoginState(
          email: LoginFormFieldModal(value: '', isDirty: false),
          password: LoginFormFieldModal(value: '', isDirty: false),
        )) {
    on<InitEvent>(_initEvent);
    on<EmailChangedEvent>(_emailChangedEvent);
    on<PasswordChangedEvent>(_passwordChangedEvent);
  }

  Future<void> _initEvent(InitEvent event, Emitter<LoginState> emitter) async {
    emitter(state.copyWith());
  }

  bool validateEmail(String data) {
    String exp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(exp).hasMatch(data);
  }

  bool validatePassword(String data) {
    return data.length > 6;
  }

  Future<void> _emailChangedEvent(
      EmailChangedEvent event, Emitter<LoginState> emitter) async {
    String msg = '';
    if (event.email.value.isEmpty) {
      msg = "Email cannot be empty.";
    } else if (!validateEmail(event.email.value)) {
      msg = "Email format is not Valid.";
    }

    emitter(state.copyWith(
      email: LoginFormFieldModal(
        value: event.email.value,
        error: msg,
        isDirty: event.email.isDirty,
      ),
    ));
  }

  Future<void> _passwordChangedEvent(
      PasswordChangedEvent event, Emitter<LoginState> emitter) async {
    String msg = '';
    if (event.password.value.isEmpty) {
      msg = "Password cannot be empty.";
    } else if (!validatePassword(event.password.value)) {
      msg = "Password cannot be less than 6 digit.";
    }

    emitter(state.copyWith(
      password: LoginFormFieldModal(
        value: event.password.value,
        error: msg,
        isDirty: event.password.isDirty,
      ),
    ));
  }

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    // print("${change.currentState.email.value} vishal");
  }
}

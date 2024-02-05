import 'dart:convert';
import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/bloc/modal/user_modal.dart';

import '../modal/login_form_field_modal.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(LoginState(
          email: LoginFormFieldModal(
            value: '',
            isDirty: false,
            error: '',
          ),
          password: LoginFormFieldModal(
            value: '',
            isDirty: false,
            error: '',
          ),
          user: UserModal(
            userId: '',
            emailId: '',
            name: '',
          ),
        )) {
    on<LoginInitEvent>(_loginInitEvent);
    on<EmailChangedEvent>(_emailChangedEvent);
    on<PasswordChangedEvent>(_passwordChangedEvent);
    on<SignInEvent>(_signInEvent);
    on<SignInLogoutEvent>(_signInLogoutEvent);
  }

  Future<void> _loginInitEvent(
      LoginInitEvent event, Emitter<LoginState> emitter) async {
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

    emitter(
      state.copyWith(
        email: LoginFormFieldModal(
          value: event.email.value,
          error: msg,
          isDirty: event.email.isDirty,
        ),
        isFail: false,
      ),
    );
  }

  Future<void> _passwordChangedEvent(
      PasswordChangedEvent event, Emitter<LoginState> emitter) async {
    String msg = '';
    if (event.password.value.isEmpty) {
      msg = "Password cannot be empty.";
    } else if (!validatePassword(event.password.value)) {
      msg = "Password cannot be less than 6 digit.";
    }

    emitter(
      state.copyWith(
        password: LoginFormFieldModal(
          value: event.password.value,
          error: msg,
          isDirty: event.password.isDirty,
        ),
        isFail: false,
      ),
    );
  }

  Future<void> _signInEvent(
      SignInEvent event, Emitter<LoginState> emitter) async {
    emitter(
      state.copyWith(
        isLoading: true,
        isSuccess: false,
        isFail: false,
        failResponse: '',
        user: UserModal.empty(),
      ),
    );
    final response =
        await http.get(Uri.parse('https://api.npoint.io/1f2f29ba66efcac29efa'));
    if (response.statusCode == 200) {
      UserModal user = UserModal.fromJson(jsonDecode(response.body));
      if (event.email == user.emailId) {
        emitter(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            isFail: false,
            failResponse: '',
            user: user,
          ),
        );
      } else {
        emitter(
          state.copyWith(
            isLoading: false,
            isSuccess: false,
            isFail: true,
            failResponse: 'Invalid Credential.',
            user: UserModal.empty(),
          ),
        );
      }
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> _signInLogoutEvent(
      SignInLogoutEvent event, Emitter<LoginState> emitter) async {
    emitter(
      state.copyWith(
        email: LoginFormFieldModal(value: '', isDirty: false, error: ''),
        password: LoginFormFieldModal(value: '', isDirty: false, error: ''),
        isLoading: false,
        isSuccess: false,
        isFail: false,
        failResponse: '',
        user: UserModal.empty(),
      ),
    );
  }

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    // print("${change.currentState} vishal");
  }
}

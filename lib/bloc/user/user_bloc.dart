import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(const UserState(
          userId: '',
          emailId: '',
          name: '',
        )) {
    on<UserInitEvent>(_userInitEvent);
    on<SetUserEvent>(_setUserEvent);
    on<LogoutUserEvent>(_logoutUserEvent);
  }

  Future<void> _userInitEvent(
      UserInitEvent event, Emitter<UserState> emitter) async {
    emitter(state.copyWith());
  }

  Future<void> _setUserEvent(
      SetUserEvent event, Emitter<UserState> emitter) async {
    emitter(state.copyWith(
      emailId: event.emailId,
      name: event.name,
      userId: event.userId,
    ));
  }

  Future<void> _logoutUserEvent(
      LogoutUserEvent event, Emitter<UserState> emitter) async {
    emitter(state.copyWith(
      isLoading: true,
    ));

    await Future.delayed(const Duration(seconds: 1));

    emitter(state.copyWith(
      emailId: '',
      name: '',
      userId: '',
      isLoading: false,
    ));
  }

  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
    // print("${change} vishal");
  }
}

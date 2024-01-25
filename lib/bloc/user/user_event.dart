part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserInitEvent extends UserEvent {
  const UserInitEvent();
}

class SetUserEvent extends UserEvent {
  final String userId;
  final String emailId;
  final String name;
  const SetUserEvent({
    required this.userId,
    required this.emailId,
    required this.name,
  });
}

class LogoutUserEvent extends UserEvent {
  const LogoutUserEvent();
}

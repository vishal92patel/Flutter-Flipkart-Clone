part of 'user_bloc.dart';

class UserState extends Equatable {
  final String userId;
  final String emailId;
  final String name;

  const UserState({
    required this.userId,
    required this.emailId,
    required this.name,
  });

  UserState copyWith({
    String? userId,
    String? emailId,
    String? name,
  }) {
    return UserState(
      userId: userId ?? this.userId,
      emailId: emailId ?? this.emailId,
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [
        userId,
        emailId,
        name,
      ];
}

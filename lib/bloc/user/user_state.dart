part of 'user_bloc.dart';

class UserState extends Equatable {
  final String userId;
  final String emailId;
  final String name;
  final bool isLoading;

  const UserState({
    required this.userId,
    required this.emailId,
    required this.name,
    this.isLoading = false,
  });

  UserState copyWith({
    String? userId,
    String? emailId,
    String? name,
    bool? isLoading,
  }) {
    return UserState(
      userId: userId ?? this.userId,
      emailId: emailId ?? this.emailId,
      name: name ?? this.name,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        userId,
        emailId,
        name,
        isLoading,
      ];
}

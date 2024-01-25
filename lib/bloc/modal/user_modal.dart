class UserModal {
  final String userId;
  final String emailId;
  final String name;
  UserModal({required this.userId, required this.emailId, required this.name});

  factory UserModal.fromJson(Map<String, dynamic> json) {
    return UserModal(
      userId: json['userId'],
      emailId: json['emailId'],
      name: json['name'],
    );
  }
}

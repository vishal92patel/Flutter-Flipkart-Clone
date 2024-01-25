class LoginFormFieldModal {
  final String value;
  final String? error;
  final bool isDirty;
  LoginFormFieldModal({required this.value, this.error, required this.isDirty});

  // LoginFormFieldModal copyWith({
  //   final String? value,
  //   final String? error,
  // }) {
  //   return LoginFormFieldModal(
  //     value: value ?? this.value,
  //     error: error ?? this.error,
  //   );
  // }
}

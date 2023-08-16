abstract interface class PasswordConfirmRequestState {
  String? get message;
}

class SuccessPasswordConfirmRequestState extends PasswordConfirmRequestState {
  @override
  final String? message;

  SuccessPasswordConfirmRequestState({
    required this.message,
  });
}

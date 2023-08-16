abstract interface class PasswordResetRequestState {
  String get message;
}

class SuccessPasswordResetRequestState extends PasswordResetRequestState {
  @override
  final String message;

  SuccessPasswordResetRequestState({
    required this.message,
  });
}

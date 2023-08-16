import '../../../models/auth/sign_up.dart';

abstract interface class SignUpState {
  SignUpData get signUp;
}

class SuccessSignUp extends SignUpState {
  @override
  final SignUpData signUp;

  SuccessSignUp({
    required this.signUp,
  });
}

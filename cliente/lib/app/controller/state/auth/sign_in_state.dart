import '../../../models/auth/sign_in.dart';

abstract interface class SignInState {
  SignInModel get login;
}

class SuccessSignInState extends SignInState {
  @override
  final SignInModel login;

  SuccessSignInState({required this.login});
}

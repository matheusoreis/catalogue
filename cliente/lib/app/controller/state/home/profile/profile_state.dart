import '../../../../models/auth/sign_in.dart';

abstract class ProfileState {
  SignInModel get userLoginData;
}

class SuccessProfileState extends ProfileState {
  @override
  final SignInModel userLoginData;

  SuccessProfileState({
    required this.userLoginData,
  });
}

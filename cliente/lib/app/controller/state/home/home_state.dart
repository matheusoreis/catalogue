import '../../../models/auth/sign_in.dart';

abstract class HomeState {
  SignInModel get userLoginData;
}

class SuccessHomeState extends HomeState {
  @override
  final SignInModel userLoginData;

  SuccessHomeState({
    required this.userLoginData,
  });
}

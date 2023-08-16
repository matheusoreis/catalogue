import '../../../../models/auth/sign_in.dart';

abstract class DrawerState {
  SignInModel get userLoginData;
}

class SuccessDrawerState extends DrawerState {
  @override
  final SignInModel userLoginData;

  SuccessDrawerState({
    required this.userLoginData,
  });
}

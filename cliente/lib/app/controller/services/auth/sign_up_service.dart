import '../../../models/auth/sign_up.dart';
import '../../../models/error_model.dart';
import '../../../shared/result.dart';
import '../../repositories/auth/sign_up_repository.dart';

class SignUpService {
  SignUpRepository signUpService;

  SignUpService({
    required this.signUpService,
  });

  Future<Result<ErrorResponse, SignUpData>> signUp({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
    required String phone,
    required String document,
  }) async {
    try {
      final result = await signUpService.signUp(
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
        name: name,
        phone: phone,
        document: document,
      );

      if (result.isSuccess) {
        return (null, result.getSuccess);
      } else {
        return (result.getFailure, null);
      }
    } catch (e) {
      return (
        ErrorResponse(
          code: 400,
          message: e.toString(),
          data: {},
        ),
        null,
      );
    }
  }
}

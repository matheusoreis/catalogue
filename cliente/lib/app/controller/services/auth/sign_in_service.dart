import '../../../models/error_model.dart';
import '../../../models/auth/sign_in.dart';

import '../../../shared/result.dart';

import '../../repositories/auth/sign_in_repository.dart';

class SignInService {
  SignInRepository signInRepository;

  SignInService({
    required this.signInRepository,
  });

  Future<Result<ErrorResponse, SignInModel>> signIn({required String identity, required String password}) async {
    try {
      final result = await signInRepository.signIn(
        identity: identity,
        password: password,
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

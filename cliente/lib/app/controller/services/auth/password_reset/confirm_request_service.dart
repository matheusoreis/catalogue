import '../../../../models/error_model.dart';

import '../../../../shared/result.dart';

import '../../../repositories/auth/password_reset/confirm_request_repository.dart';

class PasswordConfirmRequestService {
  PasswordConfirmRequestRepository passwordConfirmRequestRepository;

  PasswordConfirmRequestService({
    required this.passwordConfirmRequestRepository,
  });

  Future<Result<ErrorResponse, String>> passwordConfirmRequest({
    required String token,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      final login = await passwordConfirmRequestRepository.passwordConfirmRequest(
        token: token,
        password: password,
        passwordConfirm: passwordConfirm,
      );

      if (login.isSuccess) {
        return (null, login.getSuccess);
      } else {
        return (login.getFailure, null);
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

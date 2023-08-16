import '../../../../models/error_model.dart';

import '../../../../shared/result.dart';

import '../../../repositories/auth/password_reset/reset_request_repository.dart';

class PasswordResetRequestService {
  PasswordResetRequestRepository passwordResetRequestRepository;

  PasswordResetRequestService({
    required this.passwordResetRequestRepository,
  });

  Future<Result<ErrorResponse, String>> passwordResetRequest({required String email}) async {
    try {
      final result = await passwordResetRequestRepository.passwordResetRequest(
        email: email,
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

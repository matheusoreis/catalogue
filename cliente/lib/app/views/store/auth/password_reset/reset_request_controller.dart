import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../../controller/services/auth/password_reset/reset_request_service.dart';
import '../../../../controller/state/auth/password_reset/reset_request_state.dart';
import '../../../../shared/result.dart';

class PasswordRequestResetController extends Store<PasswordResetRequestState> {
  PasswordRequestResetController(
    this.passwordResetRequestService,
  ) : super(SuccessPasswordResetRequestState(message: ''));

  final PasswordResetRequestService passwordResetRequestService;

  Future passwordResetRequest(BuildContext context, {required String email}) async {
    setLoading(true);

    final result = await passwordResetRequestService.passwordResetRequest(email: email);

    result.fold(
      success: (success) {
        GoRouter.of(context).push('/forgotconfirm');
      },
      failure: (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              failure.message,
            ),
          ),
        );
      },
    );
  }
}

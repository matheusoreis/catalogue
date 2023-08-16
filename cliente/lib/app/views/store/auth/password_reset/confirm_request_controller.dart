import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../../controller/services/auth/password_reset/confirm_request_service.dart';
import '../../../../controller/state/auth/password_reset/confirm_request_state.dart';
import '../../../../shared/result.dart';
import '../../../components/alert_dialog.dart';
import '../../../components/buttons/button.dart';

class PasswordConfirmRequestController extends Store<PasswordConfirmRequestState> {
  PasswordConfirmRequestController(
    this.passwordConfirmRequestService,
  ) : super(SuccessPasswordConfirmRequestState(message: null));

  final PasswordConfirmRequestService passwordConfirmRequestService;

  Future passwordConfirmRequest(
    BuildContext context, {
    required String token,
    required String password,
    required String passwordConfirm,
  }) async {
    setLoading(true);

    final result = await passwordConfirmRequestService.passwordConfirmRequest(
      token: token,
      password: password,
      passwordConfirm: passwordConfirm,
    );

    result.fold(
      success: (success) {
        MyAlertModal(
          context: context,
          title: 'Sucesso',
          content: 'A sua senha foi alterada com sucesso.',
          button: [
            Button(
              text: 'Confirmar',
              onPressed: () {
                GoRouter.of(context).go('/entry');
              },
            )
          ],
        );
      },
      failure: (failure) {
        MyAlertModal(
          context: context,
          title: 'Ops',
          content: 'Os campos informados não estão corretos, verifique e tente novamente.',
          button: [
            Button(
              text: 'Confirmar',
              onPressed: () {
                GoRouter.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}

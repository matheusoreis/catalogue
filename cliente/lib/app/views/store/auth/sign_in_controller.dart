import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../controller/services/auth/sign_in_service.dart';
import '../../../controller/state/auth/sign_in_state.dart';
import '../../../models/auth/sign_in.dart';
import '../../../shared/local_storage.dart';
import '../../../shared/result.dart';
import '../../components/alert_dialog.dart';
import '../../components/buttons/button.dart';

class SignInController extends Store<SignInState> {
  SignInController({
    required this.signInService,
    required this.sharedPreferenceService,
  }) : super(SuccessSignInState(login: SignInModel.empty()));

  final SignInService signInService;
  final SharedPreferenceService sharedPreferenceService;

  Future signIn(BuildContext context, {required String identity, required String password}) async {
    setLoading(true);

    final result = await signInService.signIn(identity: identity, password: password);

    result.fold(
      success: (success) async {
        GoRouter.of(context).push('/home');

        sharedPreferenceService.saveMap(
          'userData',
          success.toMap(),
        );
      },
      failure: (failure) {
        MyAlertModal(
          context: context,
          title: 'Ops',
          content: 'O seu e-mail ou senha está incorreto, verifique os campos e tente novamente.',
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

  void goToForgot(BuildContext context) {
    GoRouter.of(context).push('/forgot');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../controller/services/auth/sign_up_service.dart';
import '../../../controller/state/auth/sign_up_state.dart';
import '../../../models/auth/sign_up.dart';
import '../../../shared/result.dart';
import '../../components/alert_dialog.dart';
import '../../components/buttons/button.dart';

class SignUpController extends Store<SignUpState> {
  SignUpController(
    this.signUpService,
  ) : super(SuccessSignUp(signUp: SignUpData.empty()));

  final SignUpService signUpService;

  Future signUp(
    BuildContext context, {
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
    required String phone,
    required String document,
  }) async {
    setLoading(true);

    final result = await signUpService.signUp(
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
      name: name,
      phone: phone,
      document: document,
    );

    result.fold(
      success: (success) {
        MyAlertModal(
          context: context,
          title: 'Sucesso',
          content: 'O seu Usuário foi cadastrado com sucesso!',
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
          content:
              'O e-mail informado já está em uso ou os campos informados não estão corretos, verifique e tente novamente.',
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

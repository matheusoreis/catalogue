import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/dependecy.dart';
import '../../../components/alert_dialog.dart';
import '../../../components/brasil_formfield.dart';
import '../../../components/buttons/button.dart';
import '../../../components/texts.dart';
import '../../../components/your_icons/your_icons_icons.dart';
import '../../../store/auth/password_reset/reset_request_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  PasswordRequestResetController passwordRequestResetController = getIt<PasswordRequestResetController>();
  final formKey = GlobalKey<FormState>();
  final emailInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double maxWidth = mediaQuery.width;
    double maxHeight = mediaQuery.height;

    double defaultPaddingTop = MediaQuery.of(context).padding.top;
    double appBarHeightDiscount = maxHeight - (defaultPaddingTop + kToolbarHeight);

    return Scaffold(
      appBar: AppBar(
        title: const HeadlineMedium(
          text: 'Esqueceu a Senha',
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              padding: const EdgeInsets.only(left: 10.0),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: SizedBox(
            width: maxWidth,
            height: appBarHeightDiscount,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 30.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: HeadlineLarge(
                              text: 'Esqueceu a senha',
                              isBold: true,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: TextFormFieldBrasil(
                                      hintText: 'Email',
                                      yourIcons: YourIcons.mail,
                                      controller: emailInputController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '';
                                        }

                                        final emailRegExp = RegExp(
                                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                                        );

                                        if (!emailRegExp.hasMatch(value)) {
                                          return '';
                                        }

                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0, top: 40.0),
                            child: SizedBox(
                              width: maxWidth,
                              child: Button(
                                text: 'Confirmar',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    MyAlertModal(
                                      context: context,
                                      title: 'Confirmar',
                                      content:
                                          'Continuar com a solicitação para trocar a senha da sua conta? \n\n ${emailInputController.text}',
                                      button: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 10.0),
                                          child: Button(
                                            text: 'Continuar',
                                            onPressed: () {
                                              GoRouter.of(context).pop();

                                              passwordRequestResetController.passwordResetRequest(
                                                context,
                                                email: emailInputController.text,
                                              );
                                            },
                                          ),
                                        ),
                                        Button(
                                          text: 'Voltar',
                                          onPressed: () {
                                            GoRouter.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

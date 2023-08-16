import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../store/auth/password_reset/confirm_request_controller.dart';
import '../../../store/password_visible.dart';
import '../../../../shared/dependecy.dart';
import '../../../components/buttons/button.dart';
import '../../../components/texts.dart';
import '../../../components/your_icons/your_icons_icons.dart';

class ForgotPageConfirm extends StatefulWidget {
  const ForgotPageConfirm({super.key});

  @override
  State<ForgotPageConfirm> createState() => _ForgotPageConfirmState();
}

class _ForgotPageConfirmState extends State<ForgotPageConfirm> {
  PasswordConfirmRequestController passwordConfirmRequestStore = getIt<PasswordConfirmRequestController>();
  final formKey = GlobalKey<FormState>();
  final tokenInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  final rePasswordInputController = TextEditingController();

  final passwordStore = PasswordVisibleController();

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
          text: 'Trocar a Senha',
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
                              text: 'Trocar a senha',
                              isBold: true,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: TextFormField(
                                      controller: tokenInputController,
                                      validator: (value) {
                                        if (value!.isEmpty || value.length < 180) {
                                          return '';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hintText: 'Token',
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 15.0, right: 5.0),
                                          child: YourIcon(
                                            YourIcons.faceId,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: ScopedBuilder<PasswordVisibleController, bool>(
                                      store: passwordStore,
                                      onState: (context, state) {
                                        return TextFormField(
                                          controller: passwordInputController,
                                          validator: (value) {
                                            if (value!.isEmpty || value.length < 5) {
                                              return '';
                                            }
                                            return null;
                                          },
                                          obscureText: !state,
                                          decoration: InputDecoration(
                                            hintText: 'Nova Senha',
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                                              child: YourIcon(
                                                state ? YourIcons.lockOpen : YourIcons.lockClosed,
                                              ),
                                            ),
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.only(right: 15.0),
                                              child: InkWell(
                                                onTap: () {
                                                  passwordStore.changeBool();
                                                },
                                                child: YourIcon(
                                                  state ? YourIcons.eyeOff : YourIcons.eyeOpen,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      //child:
                                    ),
                                  ),
                                  ScopedBuilder<PasswordVisibleController, bool>(
                                    store: passwordStore,
                                    onState: (context, state) {
                                      return TextFormField(
                                        controller: rePasswordInputController,
                                        validator: (value) {
                                          if (value!.isEmpty || value.length < 5) {
                                            return '';
                                          }
                                          return null;
                                        },
                                        obscureText: !state,
                                        decoration: InputDecoration(
                                          hintText: 'Repetir Senha',
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                                            child: YourIcon(
                                              state ? YourIcons.lockOpen : YourIcons.lockClosed,
                                            ),
                                          ),
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(right: 15.0),
                                            child: InkWell(
                                              onTap: () {
                                                passwordStore.changeBool();
                                              },
                                              child: YourIcon(
                                                state ? YourIcons.eyeOff : YourIcons.eyeOpen,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    //child:
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
                                    passwordConfirmRequestStore.passwordConfirmRequest(
                                      context,
                                      token: tokenInputController.text,
                                      password: passwordInputController.text,
                                      passwordConfirm: rePasswordInputController.text,
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

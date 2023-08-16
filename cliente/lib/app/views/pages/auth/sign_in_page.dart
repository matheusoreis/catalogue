import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../store/auth/sign_in_controller.dart';
import '../../store/password_visible.dart';
import '../../../shared/dependecy.dart';
import '../../../shared/themes/colors.dart';
import '../../components/buttons/button.dart';
import '../../components/brasil_formfield.dart';
import '../../components/texts.dart';
import '../../components/your_icons/your_icons_icons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInController loginStore = getIt<SignInController>();

  final formKey = GlobalKey<FormState>();
  final userInputController = TextEditingController();
  final passwordInputController = TextEditingController();

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
          text: 'Acessar',
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
                              text: 'Acessar',
                              isBold: true,
                            ),
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: TextFormFieldBrasil(
                                      hintText: 'Email',
                                      yourIcons: YourIcons.mail,
                                      controller: userInputController,
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
                                  ScopedBuilder<PasswordVisibleController, bool>(
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
                                          hintText: '***********',
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
                                text: 'Acessar',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    loginStore.signIn(
                                      context,
                                      identity: userInputController.text,
                                      password: passwordInputController.text,
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
                  Column(
                    children: [
                      SizedBox(
                        width: maxWidth,
                        child: Button(
                          text: 'Esqueceu a senha',
                          onPressed: () {
                            loginStore.goToForgot(context);
                          },
                          color: grayColor500,
                        ),
                      ),
                    ],
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

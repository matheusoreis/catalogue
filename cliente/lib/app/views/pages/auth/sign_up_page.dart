import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../store/auth/sign_up_controller.dart';
import '../../store/password_visible.dart';
import '../../../shared/dependecy.dart';
import '../../components/buttons/button.dart';
import '../../components/brasil_formfield.dart';
import '../../components/texts.dart';
import '../../components/your_icons/your_icons_icons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpController signUpController = getIt<SignUpController>();

  final formKey = GlobalKey<FormState>();

  final PasswordVisibleController passwordStore = PasswordVisibleController();
  final PasswordVisibleController rePasswordStore = PasswordVisibleController();

  final nameInputController = TextEditingController();
  final documentInputController = TextEditingController();
  final emailInputController = TextEditingController();
  final phoneInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  final rePasswordInputController = TextEditingController();

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
          text: 'Nova Conta',
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
                              text: 'Criar',
                              isBold: true,
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
                                    child: TextFormField(
                                      controller: nameInputController,
                                      validator: (value) {
                                        if (value!.isEmpty || value.length < 5) {
                                          return '';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                        hintText: 'Nome Completo',
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 15.0, right: 5.0),
                                          child: YourIcon(
                                            YourIcons.user,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: TextFormFieldBrasil(
                                      hintText: 'CPF/CNPJ',
                                      formatter: CpfOuCnpjFormatter(),
                                      yourIcons: YourIcons.document,
                                      controller: documentInputController,
                                      onlyNumber: true,
                                      validator: (value) {
                                        if (value!.isEmpty || value.length < 14) {
                                          return '';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.visiblePassword,
                                    ),
                                  ),
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
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: TextFormFieldBrasil(
                                      hintText: 'Telefone',
                                      formatter: TelefoneInputFormatter(),
                                      yourIcons: YourIcons.call,
                                      controller: phoneInputController,
                                      onlyNumber: true,
                                      validator: (value) {
                                        if (value!.isEmpty || value.length < 14) {
                                          return '';
                                        }

                                        return null;
                                      },
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                  ScopedBuilder<PasswordVisibleController, bool>(
                                    store: passwordStore,
                                    onState: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: TextFormField(
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
                                        ),
                                      );
                                    },
                                  ),
                                  ScopedBuilder<PasswordVisibleController, bool>(
                                    store: rePasswordStore,
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
                                                rePasswordStore.changeBool();
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
                                text: 'Finalizar',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    if (passwordInputController.text != rePasswordInputController.text) {
                                      return ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'As senha informada não são iguais!',
                                          ),
                                        ),
                                      );
                                    }

                                    signUpController.signUp(
                                      context,
                                      email: emailInputController.text,
                                      password: passwordInputController.text,
                                      passwordConfirm: rePasswordInputController.text,
                                      name: nameInputController.text,
                                      phone: phoneInputController.text,
                                      document: documentInputController.text,
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

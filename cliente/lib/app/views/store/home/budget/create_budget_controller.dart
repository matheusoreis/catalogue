// Importações de pacotes e arquivos necessários
import 'dart:convert';

import 'package:catalogue/app/shared/result.dart';
import 'package:catalogue/app/views/components/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

// Importações dos serviços de cadastro, estado de cadastro e resultado
import '../../../../controller/services/home/budget/create_budget_service.dart';
import '../../../../controller/state/home/budget/create_budget_state.dart';
import '../../../../shared/local_storage.dart';
import '../../../components/texts.dart';

// Definição da classe CreateBudgetController que estende Store<SignUpState>
class CreateBudgetController extends Store<CreateBudgetState> {
  // Construtor da classe recebe o serviço de cadastro e define o estado inicial para SuccessSignUp
  CreateBudgetController({
    required this.createBudgetService,
    required this.sharedPreferenceService,
  }) : super(SuccessCreateBudgetState(budget: null));

  // Campo para o serviço de cadastro
  final CreateBudgetService createBudgetService;
  final SharedPreferenceService sharedPreferenceService;

  // Método para realizar o cadastro (signup)
  Future createBudget(
    BuildContext context, {
    required TextEditingController name,
    required TextEditingController document,
    required TextEditingController email,
    required TextEditingController phone,
    required TextEditingController order,
    required TextEditingController city,
    required String state,
  }) async {
    // Indica que o estado está sendo carregado
    setLoading(true);

    String? dataString = await sharedPreferenceService.loadString('userData');
    var dataMap = json.decode(dataString ?? '');

    final String authorization = dataMap['token'];

    // Realiza a chamada ao serviço de orçamento (criar)
    final result = await createBudgetService.createBudget(
      name: name.text,
      document: document.text,
      email: email.text,
      phone: phone.text,
      order: order.text,
      city: city.text,
      state: state,
      authorization: authorization,
    );

    String msgSuccess =
        'Orçamento solicitado com sucesso! Nosso time de vendas entrará em contato o mais rápido possível.';

    // Verifica o resultado do cadastro
    result.fold(
      // Caso sucesso, navega para a tela de 'login' e exibe uma snackbar com a mensagem de sucesso
      success: (success) {
        Size mediaQuery = MediaQuery.of(context).size;

        double maxWidth = mediaQuery.width;

        clearTextField(
          nameInputController: name,
          documentInputController: document,
          emailInputController: email,
          phoneInputController: phone,
          cityInputController: city,
          messageInputController: order,
        );

        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: HeadlineMedium(
                text: 'Sucesso!',
                textAlign: TextAlign.center,
              ),
            ),
            content: BodyLarge(
              text: (msgSuccess),
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: SizedBox(
                  width: maxWidth,
                  child: Button(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    text: 'Voltar',
                  ),
                ),
              ),
            ],
          ),
        );
      },
      // Caso falha, exibe uma snackbar com a mensagem de erro
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

  clearTextField({
    required TextEditingController nameInputController,
    required TextEditingController documentInputController,
    required TextEditingController emailInputController,
    required TextEditingController phoneInputController,
    required TextEditingController cityInputController,
    required TextEditingController messageInputController,
  }) {
    nameInputController.clear();
    documentInputController.clear();
    emailInputController.clear();
    phoneInputController.clear();
    cityInputController.clear();
    messageInputController.clear();
  }
}

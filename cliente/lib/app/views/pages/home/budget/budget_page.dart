import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../../controller/state/home/budget/state_state.dart';
import '../../../../models/home/budget/state_model.dart';
import '../../../../shared/dependecy.dart';
import '../../../../shared/themes/colors.dart';
import '../../../components/brasil_formfield.dart';
import '../../../components/buttons/button.dart';
import '../../../components/loading_dots/loading_dots.dart';
import '../../../components/texts.dart';
import '../../../components/your_icons/your_icons_icons.dart';
import '../../../store/home/budget/create_budget_controller.dart';
import '../../../store/home/budget/state_controller.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  StateController stateController = getIt<StateController>();
  CreateBudgetController createBudgetController = getIt<CreateBudgetController>();

  final formKey = GlobalKey<FormState>();
  final nameInputController = TextEditingController();
  final documentInputController = TextEditingController();
  final emailInputController = TextEditingController();
  final phoneInputController = TextEditingController();
  final cityInputController = TextEditingController();
  final messageInputController = TextEditingController();

  @override
  void initState() {
    super.initState();

    stateController.getState(context);
  }

  late StateModelItems dropdownValue;
  String dropdownId = '';

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    double maxWidth = mediaQuery.width;
    // double maxHeight = mediaQuery.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: HeadlineMedium(
              text: 'Obter um Orçamento',
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                ),
              );
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                // formatter: ,
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: ScopedBuilder<StateController, StateState>(
                                store: stateController,
                                onLoading: (context) {
                                  return DotsLoading(
                                    color: primary500,
                                    size: 30.0,
                                  );
                                },
                                onState: (context, state) {
                                  List<StateModelItems> stateList = state.stateList;

                                  dropdownValue = stateList.first;

                                  return DropdownButtonFormField<StateModelItems>(
                                    value: dropdownValue,
                                    decoration: const InputDecoration(
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(left: 15.0, right: 5.0),
                                        child: YourIcon(YourIcons.earth),
                                      ),
                                    ),
                                    isExpanded: true,
                                    borderRadius: BorderRadius.circular(10),
                                    onChanged: (StateModelItems? value) {
                                      setState(() {
                                        dropdownValue = value!;
                                      });

                                      dropdownId = dropdownValue.id;
                                    },
                                    items: stateList.map<DropdownMenuItem<StateModelItems>>((e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(e.name),
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: TextFormField(
                                controller: cityInputController,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 5) {
                                    return '';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                  hintText: 'Cidade',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: 15.0, right: 5.0),
                                    child: YourIcon(
                                      YourIcons.location,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: TextFormField(
                                controller: messageInputController,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 15) {
                                    return '';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Mensagem',
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: YourIcon(
                                      YourIcons.chat,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                      child: SizedBox(
                        width: maxWidth,
                        child: Button(
                          text: 'Solicitar Orçamento',
                          onPressed: () {
                            if (dropdownId.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Ops! Você não selecionou o estado! Verifique e tente novamente.',
                                  ),
                                ),
                              );

                              return;
                            }

                            if (formKey.currentState!.validate()) {
                              createBudgetController.createBudget(
                                context,
                                name: nameInputController,
                                document: documentInputController,
                                email: emailInputController,
                                phone: phoneInputController,
                                order: messageInputController,
                                city: cityInputController,
                                state: dropdownId,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

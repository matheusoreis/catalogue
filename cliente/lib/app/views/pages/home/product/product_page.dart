import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/dependecy.dart';
import '../../../components/home/conditioner_list.dart';
import '../../../components/texts.dart';
import '../../../store/home/conditioner/conditioner_controller.dart';
import '../../../store/theme/theme_controller.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ConditionerController conditionerController = getIt<ConditionerController>();
  ThemeController themeController = getIt<ThemeController>();

  List<String> headersConditioner = ['disabled=false'];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      conditionerController.getConditioner(context: context, headers: headersConditioner);
    });
  }

  bool teste = false;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    double maxWidth = mediaQuery.width;
    double maxHeight = mediaQuery.height;

    setState(() {
      teste = true;
    });

    return teste == true
        ? SizedBox()
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: AppBar(
                title: const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: HeadlineMedium(
                    text: 'Produtos',
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
            body: SizedBox(
              width: maxWidth,
              height: maxHeight,
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      conditionerController.getConditioner(context: context, headers: headersConditioner);
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: ConditionerList(
                    conditionerController: conditionerController,
                    maxWidth: maxWidth,
                    maxHeight: 500,
                    scrollDirection: Axis.vertical,
                    separatorHeight: 10.0,
                  ),
                ),
              ),
            ),
          );
  }
}

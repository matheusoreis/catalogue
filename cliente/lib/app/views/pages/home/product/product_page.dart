import 'package:catalogue/app/controller/state/home/conditioner/conditioner_state.dart';
import 'package:catalogue/app/views/store/home/conditioner/conditioner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../components/texts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    double maxWidth = mediaQuery.width;
    double maxHeight = mediaQuery.height;

    return Scaffold(
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
        child: ScopedBuilder<ConditionerController, ConditionerState>(
          onState: (context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}

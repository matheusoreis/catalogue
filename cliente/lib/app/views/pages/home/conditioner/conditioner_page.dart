import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/home/conditioner/conditioners_model.dart';
import '../../../../shared/api_url.dart';
import '../../../../shared/themes/colors.dart';
import '../../../components/texts.dart';

class ConditionerPage extends StatefulWidget {
  const ConditionerPage({super.key, required this.conditionerModelItems});

  final ConditionerModelItems conditionerModelItems;

  @override
  State<ConditionerPage> createState() => _ConditionerPageState();
}

class _ConditionerPageState extends State<ConditionerPage> {
  @override
  Widget build(BuildContext context) {
    ConditionerModelItems conditionerModelItems = widget.conditionerModelItems;

    String title = '${conditionerModelItems.name} ${conditionerModelItems.model}';

    Size mediaQuery = MediaQuery.of(context).size;

    double maxWidth = mediaQuery.width;
    double maxHeight = mediaQuery.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: HeadlineMedium(
              text: title,
            ),
          ),
          backgroundColor: primary500,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primary500,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      child: SizedBox(
                        height: 320,
                        width: maxWidth,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '$apiURL/api/files/${conditionerModelItems.collectionId}/${conditionerModelItems.id}/${conditionerModelItems.image}',
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: HeadlineMedium(text: 'Especificações'),
                          ),
                          BodyLarge(text: 'Vazão de Ar: ${conditionerModelItems.airFlow}'),
                          BodyLarge(text: 'Motor: ${conditionerModelItems.engine}'),
                          BodyLarge(text: 'Voltagem: ${conditionerModelItems.voltage}'),
                          BodyLarge(text: 'Frequência: ${conditionerModelItems.frequency}'),
                          BodyLarge(text: 'Ruído: ${conditionerModelItems.noise}'),
                          BodyLarge(text: 'Consumo de Água: ${conditionerModelItems.waterConsumption}'),
                          BodyLarge(text: 'Reservatório: ${conditionerModelItems.waterTank}'),
                          BodyLarge(text: 'Área: ${conditionerModelItems.area}'),
                          BodyLarge(text: 'Material: ${conditionerModelItems.material}'),
                          BodyLarge(text: 'Dimensão: ${conditionerModelItems.dimension}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

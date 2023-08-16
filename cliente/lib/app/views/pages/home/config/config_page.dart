import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../../controller/state/home/profile/profile_state.dart';
import '../../../../shared/dependecy.dart';
import '../../../../shared/themes/colors.dart';
import '../../../components/buttons/button.dart';
import '../../../components/loading_dots/loading_dots.dart';
import '../../../components/texts.dart';
import '../../../store/home/config/config_controller.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigController configController = getIt<ConfigController>();

  @override
  void initState() {
    super.initState();
  }

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
              text: 'Configurações',
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
        child: ScopedBuilder<ConfigController, ProfileState>(
          store: configController,
          onLoading: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/img/logo_white.svg',
                  height: maxHeight / 13,
                ),
                DotsLoading(
                  color: darkRed500,
                  size: 30.0,
                ),
              ],
            );
          },
          onState: (context, state) {
            return SizedBox(
              width: maxWidth,
              height: maxHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SizedBox(
                              width: maxWidth,
                              child: Button(
                                text: 'Botão',
                                onPressed: () {
                                  configController.changeTheme();
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
            );
          },
        ),
      ),
    );
  }
}

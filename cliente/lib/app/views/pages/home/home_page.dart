import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../controller/state/home/home_state.dart';
import '../../../models/auth/sign_in.dart';
import '../../../shared/dependecy.dart';
import '../../../shared/themes/colors.dart';
import '../../components/on_error.dart';
import '../../components/on_loading.dart';
import '../../components/your_icons/your_icons_icons.dart';
import '../../store/home/config/config_controller.dart';
import '../../store/home/home_controller.dart';
import 'drawer/drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = getIt<HomeController>();
  ConfigController profileController = getIt<ConfigController>();

  @override
  void initState() {
    super.initState();

    homeController.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    // double maxWidth = mediaQuery.width;
    double maxHeight = mediaQuery.height;

    return ScopedBuilder<HomeController, HomeState>(
      store: homeController,
      onLoading: (context) => OnLoading(maxHeight: maxHeight, color: Colors.white),
      onError: (context, error) => const OnError(),
      onState: (context, state) {
        final SignInModelRecord userData = state.userLoginData.record;

        return Scaffold(
          drawer: Drawer(
            width: 260,
            child: DrawerPage(
              signInModelRecord: userData,
            ),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: InkWell(
                      child: const YourIcon(
                        YourIcons.apps,
                        size: 28,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  );
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 20),
                  child: SvgPicture.asset(
                    'assets/img/logo_white.svg',
                    height: maxHeight / 22,
                  ),
                ),
              ],
              backgroundColor: primary500,
              flexibleSpace: const FlexibleSpaceBar(),
            ),
          ),
          body: const Center(),
        );
      },
    );
  }
}

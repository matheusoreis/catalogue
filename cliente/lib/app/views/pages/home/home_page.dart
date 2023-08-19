import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../controller/state/home/home_state.dart';
import '../../../models/auth/sign_in.dart';
import '../../../shared/dependecy.dart';
import '../../../shared/themes/colors.dart';
import '../../components/home/conditioner_list.dart';
import '../../components/on_error.dart';
import '../../components/on_loading.dart';
import '../../components/texts.dart';
import '../../components/your_icons/your_icons_icons.dart';
import '../../store/home/home_controller.dart';
import 'drawer/drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = getIt<HomeController>();

  String filterURL = 'emphasis=true';

  @override
  void initState() {
    super.initState();

    homeController.getUserData();
    homeController.conditionerController.getConditioner(context, filterURL);
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    double maxWidth = mediaQuery.width;
    double maxHeight = mediaQuery.height;

    return ScopedBuilder<HomeController, HomeState>(
      store: homeController,
      onLoading: (context) => OnLoading(
        maxHeight: maxHeight,
        colorInLight: lightTextColor,
        colorInDark: darkTextColor,
      ),
      onError: (context, error) => const OnError(
        error: null,
      ),
      onState: (context, state) {
        final SignInModelRecord userData = state.userLoginData.record;

        return Scaffold(
          drawer: Drawer(
            width: 260,
            child: DrawerPage(
              signInModelRecord: userData,
            ),
          ),
          appBar: AppBar(
            toolbarHeight: 80,
            leading: Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
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
                padding: const EdgeInsets.only(right: 20, top: 0, bottom: 0),
                child: SvgPicture.asset(
                  'assets/img/logo.svg',
                  alignment: Alignment.centerRight,
                  width: 140,
                ),
              ),
            ],
            backgroundColor: primary500,
            flexibleSpace: const FlexibleSpaceBar(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    homeController.conditionerController.getConditioner(context, filterURL);
                  },
                );
              },
              child: ListView(
                children: [
                  ConditionerList(
                    homeController: homeController,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadlineMedium(text: 'Blog'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

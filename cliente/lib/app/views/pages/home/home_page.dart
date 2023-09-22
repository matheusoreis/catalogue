import 'package:catalogue/app/views/components/texts.dart';
import 'package:catalogue/app/views/store/home/conditioner/conditioner_controller.dart';
import 'package:catalogue/app/views/store/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../controller/state/home/home_state.dart';
import '../../../models/auth/sign_in.dart';
import '../../../shared/dependecy.dart';
import '../../../shared/themes/colors.dart';
import '../../components/home/blog_list.dart';
import '../../components/home/conditioner_list.dart';
import '../../components/on_error.dart';
import '../../components/on_loading.dart';
import '../../components/your_icons/your_icons_icons.dart';
import '../../store/home/blog/blog_controller.dart';
import '../../store/home/home_controller.dart';
import 'drawer/drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = getIt<HomeController>();
  BlogController blogController = getIt<BlogController>();
  ThemeController themeController = getIt<ThemeController>();

  ConditionerController conditionerController = getIt<ConditionerController>();

  List<String> headersConditioner = ['emphasis=true', 'disabled=false'];
  List<String> headersBlog = ['disabled=false'];

  @override
  void initState() {
    super.initState();

    homeController.getUserData();

    conditionerController.getConditioner(context: context, headers: headersConditioner);
    blogController.getBlog(context: context, headers: headersBlog);
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    conditionerController.getConditioner(context: context, headers: headersConditioner);
                    blogController.getBlog(context: context, headers: headersBlog);
                  },
                );
              },
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeadlineMedium(text: 'Destaque'),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          height: 420,
                          width: maxWidth,
                          child: ConditionerList(
                            conditionerController: conditionerController,
                            maxWidth: maxWidth,
                            maxHeight: maxHeight,
                            scrollDirection: Axis.horizontal,
                            separatorWidth: 10.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeadlineMedium(text: 'Blog'),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          height: 480,
                          width: maxWidth,
                          child: BlogList(
                            blogController: blogController,
                            maxWidth: maxWidth,
                            maxHeight: maxHeight,
                            scrollDirection: Axis.horizontal,
                            separatorWidth: 10.0,
                          ),
                        ),
                      ),
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

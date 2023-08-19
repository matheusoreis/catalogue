import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import 'shared/dependecy.dart';
import 'shared/routes.dart';
import 'shared/themes/themes.dart';
import 'views/store/theme/theme_controller.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key, required this.isFirstEntry});

  final bool isFirstEntry;

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  ThemeController themeController = getIt<ThemeController>();

  late GoRouter routes;

  @override
  void initState() {
    super.initState();

    themeController.loadingTheme();

    routes = GoRouter(
      initialLocation: widget.isFirstEntry == true ? '/' : '/entry',
      routes: appRoutes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<ThemeController, ThemeMode>(
      store: themeController,
      onState: (context, state) {
        return MaterialApp.router(
          title: 'Tecnobrisa',
          themeMode: themeController.state,
          theme: lightTheme,
          darkTheme: darkTheme,
          routerDelegate: routes.routerDelegate,
          routeInformationParser: routes.routeInformationParser,
          routeInformationProvider: routes.routeInformationProvider,
        );
      },
    );
  }
}

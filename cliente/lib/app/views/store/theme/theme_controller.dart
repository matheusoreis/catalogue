import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../shared/local_storage.dart';

class ThemeController extends Store<ThemeMode> {
  ThemeController(this.shared) : super(ThemeMode.system);

  final SharedPreferenceService shared;

  ThemeMode get themeMode => state;

  bool get isLightTheme => state == ThemeMode.light;

  Future<void> saveTheme(bool isDark) async {
    await shared.saveBool('isDark', isDark);
  }

  Future<void> loadingTheme() async {
    final bool isDark = await shared.loadBool('isDark') ?? false;

    if (isDark) {
      update(ThemeMode.dark);
    } else {
      update(ThemeMode.light);
    }
  }

  Future<void> toggleThemeMode() async {
    if (isLightTheme) {
      await saveTheme(true);
      update(ThemeMode.dark);
    } else {
      await saveTheme(false);
      update(ThemeMode.light);
    }
  }
}

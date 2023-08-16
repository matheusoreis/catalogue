import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'app/shared/dependecy.dart';
import 'app/shared/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupProviders();

  SharedPreferenceService sharedPreferenceService = getIt<SharedPreferenceService>();
  bool isFirstEntry = await sharedPreferenceService.loadBool('IsFirstEntry') ?? true;

  runApp(
    AppWidget(isFirstEntry: isFirstEntry),
  );
}

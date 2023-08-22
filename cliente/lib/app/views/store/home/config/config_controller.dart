import 'package:flutter_triple/flutter_triple.dart';

import '../../../../controller/state/home/profile/profile_state.dart';
import '../../../../models/auth/sign_in.dart';
import '../../../../shared/dependecy.dart';
import '../../../../shared/local_storage.dart';
import '../../theme/theme_controller.dart';

class ConfigController extends Store<ProfileState> {
  ConfigController({
    required this.sharedPreferenceService,
  }) : super(SuccessProfileState(userLoginData: SignInModel.empty()));

  final SharedPreferenceService sharedPreferenceService;
  ThemeController themeController = getIt<ThemeController>();

  changeTheme() {
    themeController.toggleThemeMode();
  }
}

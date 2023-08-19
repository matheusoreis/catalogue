import 'dart:convert';

import 'package:flutter_triple/flutter_triple.dart';

import '../../../controller/state/home/home_state.dart';
import '../../../models/auth/sign_in.dart';
import '../../../shared/local_storage.dart';
import '../theme/theme_controller.dart';
import 'conditioner/conditioner_controller.dart';

class HomeController extends Store<HomeState> {
  HomeController(
    this.sharedPreferenceService,
    this.conditionerController,
    this.themeController,
  ) : super(SuccessHomeState(userLoginData: SignInModel.empty()));

  final SharedPreferenceService sharedPreferenceService;
  final ConditionerController conditionerController;
  final ThemeController themeController;

  Future<void> getUserData() async {
    String? dataString = await sharedPreferenceService.loadString('userData');

    var dataMap = json.decode(dataString ?? '');

    update(
      SuccessHomeState(
        userLoginData: SignInModel.fromJson(
          dataMap,
        ),
      ),
    );
  }
}

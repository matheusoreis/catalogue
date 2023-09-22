import 'dart:convert';

import 'package:flutter_triple/flutter_triple.dart';

import '../../../controller/state/home/home_state.dart';
import '../../../models/auth/sign_in.dart';
import '../../../shared/local_storage.dart';

class HomeController extends Store<HomeState> {
  HomeController({
    required this.sharedPreferenceService,
  }) : super(SuccessHomeState(userLoginData: SignInModel.empty()));

  final SharedPreferenceService sharedPreferenceService;

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

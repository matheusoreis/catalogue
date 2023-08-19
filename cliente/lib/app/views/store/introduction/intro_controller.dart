import 'package:catalogue/app/views/store/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../controller/services/introduction/intro_service.dart';
import '../../../controller/state/introduction/intro_state.dart';
import '../../../models/introduction/intro.dart';
import '../../../shared/local_storage.dart';
import '../../../shared/result.dart';

class IntroController extends Store<IntroState> {
  IntroController(
    this.introService,
    this.sharedPreferenceService,
    this.themeController,
  ) : super(SuccessIntroState(intro: IntroModelData.empty()));

  final IntroService introService;
  final SharedPreferenceService sharedPreferenceService;
  final ThemeController themeController;

  Future getIntro(BuildContext context) async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 3));

    final result = await introService.getIntro();

    result.fold(
      success: (success) {
        update(
          SuccessIntroState(
            intro: success,
          ),
        );
      },
      failure: (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              failure.message,
            ),
          ),
        );
      },
    );
  }

  void goToEntryPage({required BuildContext context}) async {
    GoRouter.of(context).go('/entry');
    sharedPreferenceService.saveBool('IsFirstEntry', false);
  }

  void nextPage({required PageController pageController}) {
    pageController.animateToPage(
      pageController.page!.toInt() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }
}

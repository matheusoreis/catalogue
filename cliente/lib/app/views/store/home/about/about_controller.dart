import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../controller/services/home/about/about_service.dart';
import '../../../../controller/state/home/about/about_state.dart';
import '../../../../models/home/about/about_model.dart';
import '../../../../shared/result.dart';

class AboutController extends Store<AboutState> {
  AboutController({required this.aboutService}) : super(SuccessAboutState(about: AboutModelData.empty()));

  final AboutService aboutService;

  Future getAbout(BuildContext context) async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    final result = await aboutService.getAbout();

    result.fold(
      success: (success) {
        update(
          SuccessAboutState(
            about: success,
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
}

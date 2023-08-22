import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:go_router/go_router.dart';

import '../../../controller/services/introduction/entry_service.dart';
import '../../../controller/state/introduction/entry_state.dart';
import '../../../models/auth/sign_in.dart';
import '../../../models/introduction/entry.dart';
import '../../../shared/local_storage.dart';
import '../../../shared/result.dart';
import '../theme/theme_controller.dart';

class EntryController extends Store<EntryState> {
  EntryController({
    required this.entryService,
    required this.sharedPreferenceService,
    required this.themeController,
  }) : super(SuccessEntryState(entry: EntryModelData.clear()));

  final EntryService entryService;
  final SharedPreferenceService sharedPreferenceService;
  final ThemeController themeController;

  Future getEntry(BuildContext context) async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    final result = await entryService.getEntry();

    result.fold(
      success: (success) {
        update(
          SuccessEntryState(
            entry: success,
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

  goToLoginPage({required BuildContext context}) async {
    final dataString = await sharedPreferenceService.loadString('userData') ?? '';

    if (dataString.isEmpty) {
      if (context.mounted) GoRouter.of(context).push('/login');
    } else {
      final dataJson = json.decode(dataString);
      final dataMap = SignInModel.fromJson(dataJson);

      final destination = dataMap.token.isNotEmpty ? '/home' : '/login';
      if (context.mounted) GoRouter.of(context).push(destination);
    }
  }

  goToSignUpPage({required BuildContext context}) {
    GoRouter.of(context).push('/signup');
  }
}

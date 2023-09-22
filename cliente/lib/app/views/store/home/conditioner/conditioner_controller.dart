import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../controller/services/home/conditioner/conditioner_service.dart';
import '../../../../controller/state/home/conditioner/conditioner_state.dart';
import '../../../../models/home/conditioner/conditioners_model.dart';
import '../../../../shared/local_storage.dart';
import '../../../../shared/result.dart';

class ConditionerController extends Store<ConditionerState> {
  ConditionerController({
    required this.conditionerService,
    required this.sharedPreferenceService,
  }) : super(SuccessConditionerState(conditioner: ConditionerModelData.blank()));

  final ConditionerService conditionerService;
  final SharedPreferenceService sharedPreferenceService;

  Future getConditioner({required BuildContext context, required List<String> headers}) async {
    setLoading(true);

    String? dataString = await sharedPreferenceService.loadString('userData');
    var dataMap = json.decode(dataString ?? '');

    final String authorization = dataMap['token'];

    await Future.delayed(const Duration(seconds: 1));

    final result = await conditionerService.getConditioner(headers: headers, authorization: authorization);

    result.fold(
      success: (success) {
        update(
          SuccessConditionerState(
            conditioner: success,
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

import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../controller/services/home/budget/state_service.dart';
import '../../../../controller/state/home/budget/state_state.dart';
import '../../../../models/home/budget/state_model.dart';
import '../../../../shared/result.dart';

class StateController extends Store<StateState> {
  StateController(
    this.stateService,
  ) : super(SuccessStateState(
          state: StateModelData.empty(),
          stateList: [
            StateModelItems.empty(),
          ],
        ));

  final StateService stateService;

  Future getState(BuildContext context) async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 3));

    final result = await stateService.getState();

    result.fold(
      success: (success) {
        List<StateModelItems> stateList = [
          StateModelItems(
            collectionId: '',
            collectionName: '',
            created: '',
            id: '',
            name: 'Selecione o Estado',
            reduction: '',
            disabled: false,
            updated: '',
          ),
        ];

        for (var element in success.items) {
          stateList.add(element);
        }

        stateList.removeWhere((item) {
          return item.disabled == true;
        });

        update(
          SuccessStateState(
            state: success,
            stateList: stateList,
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

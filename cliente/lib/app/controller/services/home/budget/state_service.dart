import '../../../../models/error_model.dart';

import '../../../../models/home/budget/state_model.dart';
import '../../../../shared/result.dart';

import '../../../repositories/home/budget/state_repository.dart';

class StateService {
  StateRepository stateRepository;

  StateService({
    required this.stateRepository,
  });

  Future<Result<ErrorResponse, StateModelData>> getState({required String authorization}) async {
    try {
      final state = await stateRepository.getState(authorization: authorization);

      if (state.isSuccess) {
        return (null, state.getSuccess);
      } else {
        return (state.getFailure, null);
      }
    } catch (e) {
      return (
        ErrorResponse(
          code: 400,
          message: e.toString(),
          data: {},
        ),
        null,
      );
    }
  }
}

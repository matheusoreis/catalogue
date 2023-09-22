import '../../../../models/error_model.dart';
import '../../../../models/home/conditioner/conditioners_model.dart';
import '../../../../shared/result.dart';
import '../../../repositories/home/conditioner/conditioners_repository.dart';

class ConditionerService {
  ConditionerRepository conditionerRepository;

  ConditionerService({
    required this.conditionerRepository,
  });

  Future<Result<ErrorResponse, ConditionerModelData>> getConditioner({
    required List<String> headers,
    required String authorization,
  }) async {
    try {
      final conditioner = await conditionerRepository.getConditioner(
        headers: headers,
        authorization: authorization,
      );

      if (conditioner.isSuccess) {
        return (null, conditioner.getSuccess);
      } else {
        return (conditioner.getFailure, null);
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

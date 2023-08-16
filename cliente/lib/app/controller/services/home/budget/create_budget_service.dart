import '../../../../models/error_model.dart';
import '../../../../models/home/budget/create_budget_model.dart';
import '../../../../shared/result.dart';
import '../../../repositories/home/budget/create_budget_repository.dart';

class CreateBudgetService {
  CreateBudgetRepository createBudgetRepository;

  CreateBudgetService({
    required this.createBudgetRepository,
  });

  Future<Result<ErrorResponse, CreateBudgetModel>> createBudget({
    required String name,
    required String document,
    required String email,
    required String phone,
    required String order,
    required String city,
    required String state,
    required String authorization,
  }) async {
    try {
      final result = await createBudgetRepository.createBudget(
        name: name,
        document: document,
        email: email,
        phone: phone,
        order: order,
        city: city,
        state: state,
        authorization: authorization,
      );

      if (result.isSuccess) {
        return (null, result.getSuccess);
      } else {
        return (result.getFailure, null);
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

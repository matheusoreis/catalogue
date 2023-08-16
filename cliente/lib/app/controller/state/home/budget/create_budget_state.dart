import '../../../../models/home/budget/create_budget_model.dart';

abstract interface class CreateBudgetState {
  CreateBudgetModel? get budget;
}

class SuccessCreateBudgetState extends CreateBudgetState {
  @override
  final CreateBudgetModel? budget;

  SuccessCreateBudgetState({required this.budget});
}

import '../../../../models/home/conditioner/conditioners_model.dart';

abstract class ConditionerState {
  ConditionerModelData get conditioner;
}

class SuccessConditionerState extends ConditionerState {
  @override
  final ConditionerModelData conditioner;

  SuccessConditionerState({
    required this.conditioner,
  });
}

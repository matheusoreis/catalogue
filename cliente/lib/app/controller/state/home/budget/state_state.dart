import '../../../../models/home/budget/state_model.dart';

abstract interface class StateState {
  StateModelData get state;
  List<StateModelItems> get stateList;
}

class SuccessStateState extends StateState {
  @override
  final StateModelData state;

  @override
  List<StateModelItems> stateList;

  SuccessStateState({required this.state, required this.stateList});
}

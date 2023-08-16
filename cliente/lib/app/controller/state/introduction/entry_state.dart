import '../../../models/introduction/entry.dart';

abstract interface class EntryState {
  EntryModelData? get entry;
}

class SuccessEntryState extends EntryState {
  @override
  final EntryModelData? entry;

  SuccessEntryState({
    required this.entry,
  });
}

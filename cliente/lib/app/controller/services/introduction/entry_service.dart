import '../../../models/error_model.dart';
import '../../../models/introduction/entry.dart';
import '../../../shared/result.dart';
import '../../repositories/introduction/entry_repository.dart';

class EntryService {
  EntryRepository entryRepository;

  EntryService({
    required this.entryRepository,
  });

  Future<Result<ErrorResponse, EntryModelData>> getEntry() async {
    try {
      final entry = await entryRepository.getEntry();

      if (entry.isSuccess) {
        return (null, entry.getSuccess);
      } else {
        return (entry.getFailure, null);
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

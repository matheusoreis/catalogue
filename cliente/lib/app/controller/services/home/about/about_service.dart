import '../../../../models/error_model.dart';
import '../../../../models/home/about/about_model.dart';
import '../../../../shared/result.dart';
import '../../../repositories/home/about/about_repository.dart';

class AboutService {
  AboutRepository aboutRepository;

  AboutService({
    required this.aboutRepository,
  });

  Future<Result<ErrorResponse, AboutModelData>> getAbout() async {
    try {
      final state = await aboutRepository.getAbout();

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

import '../../../models/error_model.dart';
import '../../../models/introduction/intro.dart';
import '../../../shared/result.dart';
import '../../repositories/introduction/introduction_repository.dart';

class IntroService {
  IntroductionRepository introductionRepository;

  IntroService({
    required this.introductionRepository,
  });

  Future<Result<ErrorResponse, IntroModelData>> getIntro() async {
    try {
      final intro = await introductionRepository.getIntroduction();

      if (intro.isSuccess) {
        return (null, intro.getSuccess);
      } else {
        return (intro.getFailure, null);
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

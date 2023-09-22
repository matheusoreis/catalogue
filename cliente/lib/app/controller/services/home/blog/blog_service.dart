import '../../../../models/error_model.dart';
import '../../../../models/home/blog/blog_model.dart';
import '../../../../shared/result.dart';
import '../../../repositories/home/blog/blog_repository.dart';

class BlogService {
  BlogRepository blogRepository;

  BlogService({
    required this.blogRepository,
  });

  Future<Result<ErrorResponse, BlogModelData>> getBlog({
    required String authorization,
    required List<String> headers,
  }) async {
    try {
      final state = await blogRepository.getBlog(authorization: authorization, headers: headers);

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

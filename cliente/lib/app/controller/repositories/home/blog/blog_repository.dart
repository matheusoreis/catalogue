import '../../../../models/error_model.dart';
import '../../../../models/home/blog/blog_model.dart';
import '../../../../shared/result.dart';
import '../../../client/http_client.dart';

class BlogRepository {
  final MyHttpClient myHttpClient;

  BlogRepository({
    required this.myHttpClient,
  });

  Future<Result<ErrorResponse, BlogModelData>> getBlog({
    required String authorization,
    required List<String> headers,
  }) async {
    const String url = '/api/collections/blog/records';

    final response = await myHttpClient.get(
      url: url,
      headers: {
        'Content-Type': 'application/json',
        "authorization": authorization,
      },
      query: {
        "filter": "(${headers.join('&&')})",
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = response.data;

      final blogResponseModel = BlogModelData.fromJson(body);

      return (null, blogResponseModel);
    } else {
      final Map<String, dynamic> body = response.data;

      final stateErrorResponse = ErrorResponse.fromJson(body);

      return (stateErrorResponse, null);
    }
  }
}

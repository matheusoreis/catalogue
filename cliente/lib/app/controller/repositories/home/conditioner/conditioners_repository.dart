import '../../../../models/error_model.dart';
import '../../../../models/home/conditioner/conditioners_model.dart';
import '../../../../shared/result.dart';
import '../../../client/http_client.dart';

class ConditionerRepository {
  final MyHttpClient myHttpClient;

  ConditionerRepository({required this.myHttpClient});

  Future<Result<ErrorResponse, ConditionerModelData>> getConditioner({
    required String authorization,
    required List<String> headers,
  }) async {
    const String url = '/api/collections/conditioners/records';

    final response = await myHttpClient.get(
      url: url,
      headers: {
        'Content-Type': 'application/json',
        'authorization': authorization,
      },
      query: {
        "filter": "(${headers.join('&&')})",
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = response.data;

      final conditionersResponseModel = ConditionerModelData.fromJson(body);

      return (null, conditionersResponseModel);
    } else {
      final Map<String, dynamic> body = response.data;

      final conditionersErrorResponse = ErrorResponse.fromJson(body);

      return (conditionersErrorResponse, null);
    }
  }
}

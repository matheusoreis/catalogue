import '../../../../models/error_model.dart';
import '../../../../models/home/budget/state_model.dart';
import '../../../../shared/result.dart';
import '../../../client/http_client.dart';

class StateRepository {
  final MyHttpClient myHttpClient;

  StateRepository({
    required this.myHttpClient,
  });

  Future<Result<ErrorResponse, StateModelData>> getState({required String authorization}) async {
    const String url = '/api/collections/state/records';

    final response = await myHttpClient.get(
      url: url,
      headers: {
        'Content-Type': 'application/json',
        "authorization": authorization,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = response.data;

      final stateResponseModel = StateModelData.fromJson(body);

      return (null, stateResponseModel);
    } else {
      final Map<String, dynamic> body = response.data;

      final stateErrorResponse = ErrorResponse.fromJson(body);

      return (stateErrorResponse, null);
    }
  }
}

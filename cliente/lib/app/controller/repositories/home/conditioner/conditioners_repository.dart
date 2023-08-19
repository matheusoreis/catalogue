import 'dart:convert';

import '../../../../models/error_model.dart';
import '../../../../models/home/conditioner/conditioners_model.dart';
import '../../../../shared/api_url.dart';
import '../../../../shared/result.dart';
import '../../../client/http_client.dart';

class ConditionerRepository {
  final MyHttpClient myHttpClient;

  ConditionerRepository({required this.myHttpClient});

  Future<Result<ErrorResponse, ConditionerModelData>> getConditioner(
    String? headers, {
    required String authorization,
  }) async {
    final String url = '$apiURL/api/collections/conditioners/records?filter=($headers)';

    final response = await myHttpClient.get(
      url: url,
      headers: {
        'Content-Type': 'application/json',
        "authorization": authorization,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);

      final conditionersResponseModel = ConditionerModelData.fromJson(body);

      return (null, conditionersResponseModel);
    } else {
      final Map<String, dynamic> body = jsonDecode(response.body);

      final conditionersErrorResponse = ErrorResponse.fromJson(body);

      return (conditionersErrorResponse, null);
    }
  }
}

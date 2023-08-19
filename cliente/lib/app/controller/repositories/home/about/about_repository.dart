import 'dart:convert';

import '../../../../models/error_model.dart';
import '../../../../models/home/about/about_model.dart';
import '../../../../shared/api_url.dart';
import '../../../../shared/result.dart';
import '../../../client/http_client.dart';

class AboutRepository {
  final MyHttpClient myHttpClient;

  AboutRepository({
    required this.myHttpClient,
  });

  Future<Result<ErrorResponse, AboutModelData>> getAbout({required String authorization}) async {
    const String url = '$apiURL/api/collections/about/records';

    final response = await myHttpClient.get(
      url: url,
      headers: {
        'Content-Type': 'application/json',
        "authorization": authorization,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);

      final aboutResponseModel = AboutModelData.fromJson(body);

      return (null, aboutResponseModel);
    } else {
      final Map<String, dynamic> body = jsonDecode(response.body);

      final stateErrorResponse = ErrorResponse.fromJson(body);

      return (stateErrorResponse, null);
    }
  }
}

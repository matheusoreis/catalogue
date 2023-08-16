import 'dart:convert';

import '../../../models/error_model.dart';
import '../../../models/introduction/intro.dart';
import '../../../shared/api_url.dart';
import '../../../shared/result.dart';
import '../../client/http_client.dart';

class IntroductionRepository {
  final MyHttpClient myHttpClient;

  IntroductionRepository({
    required this.myHttpClient,
  });

  Future<Result<ErrorResponse, IntroModelData>> getIntroduction() async {
    const String url = '$apiURL/api/collections/intro/records';

    final response = await myHttpClient.get(url: url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);

      final introductionResponseModel = IntroModelData.fromJson(body);

      return (null, introductionResponseModel);
    } else {
      final Map<String, dynamic> body = jsonDecode(response.body);

      final loginErrorResponse = ErrorResponse.fromJson(body);

      return (loginErrorResponse, null);
    }
  }
}

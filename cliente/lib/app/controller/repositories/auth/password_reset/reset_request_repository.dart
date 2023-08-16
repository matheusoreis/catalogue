import 'dart:convert';

import '../../../../models/error_model.dart';

import '../../../../shared/api_url.dart';

import '../../../../shared/result.dart';

import '../../../client/http_client.dart';

class PasswordResetRequestRepository {
  final MyHttpClient myHttpClient;

  PasswordResetRequestRepository({required this.myHttpClient});

  Future<Result<ErrorResponse, String>> passwordResetRequest({
    required String email,
  }) async {
    const String url = '$apiURL/api/collections/users/request-password-reset';

    final response = await myHttpClient.post(
      url: url,
      body: jsonEncode(
        <String, dynamic>{
          "email": email,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 204) {
      return (null, 'O código para redefinir sua senha foi enviado para o seu e-mail!');
    } else {
      final Map<String, dynamic> body = jsonDecode(response.body);

      final passwordRequestResetResponse = ErrorResponse.fromJson(body);

      return (passwordRequestResetResponse, null);
    }
  }
}

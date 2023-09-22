import 'dart:convert';

import '../../../../models/error_model.dart';
import '../../../../shared/result.dart';
import '../../../client/http_client.dart';

class PasswordConfirmRequestRepository {
  final MyHttpClient myHttpClient;

  PasswordConfirmRequestRepository({required this.myHttpClient});

  Future<Result<ErrorResponse, String>> passwordConfirmRequest({
    required String token,
    required String password,
    required String passwordConfirm,
  }) async {
    const String url = '/api/collections/users/confirm-password-reset';

    final response = await myHttpClient.post(
      url: url,
      body: jsonEncode(
        <String, dynamic>{
          "token": token,
          "password": password,
          "passwordConfirm": passwordConfirm,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 204 || response.statusCode == 200) {
      return (null, 'Sua senha foi redefinida com sucesso!');
    } else {
      final Map<String, dynamic> body = response.data;

      final passwordConfirmResetRepository = ErrorResponse.fromJson(body);

      return (passwordConfirmResetRepository, null);
    }
  }
}

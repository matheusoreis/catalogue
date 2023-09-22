import 'dart:convert';

import '../../../models/auth/sign_in.dart';
import '../../../models/error_model.dart';
import '../../../shared/result.dart';
import '../../client/http_client.dart';

class SignInRepository {
  final MyHttpClient myHttpClient;

  SignInRepository({required this.myHttpClient});

  Future<Result<ErrorResponse, SignInModel>> signIn({
    required String identity,
    required String password,
  }) async {
    const String url = '/api/collections/users/auth-with-password';

    final response = await myHttpClient.post(
      url: url,
      body: jsonEncode(
        <String, dynamic>{
          "identity": identity,
          "password": password,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = response.data;

      final loginResponseModel = SignInModel.fromJson(body);

      return (null, loginResponseModel);
    } else {
      final Map<String, dynamic> body = response.data;

      final loginErrorResponse = ErrorResponse.fromJson(body);

      return (loginErrorResponse, null);
    }
  }
}

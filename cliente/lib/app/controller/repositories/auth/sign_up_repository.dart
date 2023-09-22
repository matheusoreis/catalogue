import 'dart:convert';

import '../../../models/auth/sign_up.dart';
import '../../../models/error_model.dart';
import '../../../shared/result.dart';
import '../../client/http_client.dart';

class SignUpRepository {
  final MyHttpClient myHttpClient;

  SignUpRepository({required this.myHttpClient});

  Future<Result<ErrorResponse, SignUpData>> signUp({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
    required String phone,
    required String document,
  }) async {
    const String url = '/api/collections/users/records';

    final response = await myHttpClient.post(
      url: url,
      body: jsonEncode(
        <String, dynamic>{
          "email": email,
          "password": password,
          "passwordConfirm": passwordConfirm,
          "name": name,
          "phone": phone,
          "document": document,
          "access": 'User'
        },
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = response.data;

      final signUpResponseModel = SignUpData.fromJson(body);

      return (null, signUpResponseModel);
    } else {
      final Map<String, dynamic> body = response.data;

      final signUpResponseModel = ErrorResponse.fromJson(body);

      return (signUpResponseModel, null);
    }
  }
}

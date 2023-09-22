import 'dart:convert';

import '../../../../models/error_model.dart';
import '../../../../models/home/budget/create_budget_model.dart';
import '../../../../shared/result.dart';
import '../../../client/http_client.dart';

class CreateBudgetRepository {
  final MyHttpClient myHttpClient;

  CreateBudgetRepository({required this.myHttpClient});

  Future<Result<ErrorResponse, CreateBudgetModel>> createBudget({
    required String name,
    required String document,
    required String email,
    required String phone,
    required String order,
    required String city,
    required String state,
    required String authorization,
  }) async {
    const String url = '/api/collections/budget/records';

    final response = await myHttpClient.post(
      url: url,
      body: jsonEncode(
        <String, dynamic>{
          "name": name,
          "document": document,
          "email": email,
          "phone": phone,
          "order": order,
          "city": city,
          "state": state,
          "active": false,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        "authorization": authorization,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = response.data;

      final createBudgetResponseModel = CreateBudgetModel.fromJson(body);

      return (null, createBudgetResponseModel);
    } else {
      final Map<String, dynamic> body = response.data;

      final signUpResponseModel = ErrorResponse.fromJson(body);

      return (signUpResponseModel, null);
    }
  }
}

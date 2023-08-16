import 'dart:convert';

import '../../../models/introduction/entry.dart';
import '../../client/http_client.dart';

import '../../../models/error_model.dart';

import '../../../shared/result.dart';

import '../../../shared/api_url.dart';

class EntryRepository {
  final MyHttpClient myHttpClient;

  EntryRepository({required this.myHttpClient});

  Future<Result<ErrorResponse, EntryModelData>> getEntry() async {
    const String url = '$apiURL/api/collections/entry/records';

    final response = await myHttpClient.get(url: url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);

      final entryResponseModel = EntryModelData.fromJson(body);

      return (null, entryResponseModel);
    } else {
      final Map<String, dynamic> body = jsonDecode(response.body);

      final loginErrorResponse = ErrorResponse.fromJson(body);

      return (loginErrorResponse, null);
    }
  }
}

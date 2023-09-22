import '../../../models/introduction/entry.dart';
import '../../client/http_client.dart';

import '../../../models/error_model.dart';

import '../../../shared/result.dart';

class EntryRepository {
  final MyHttpClient myHttpClient;

  EntryRepository({required this.myHttpClient});

  Future<Result<ErrorResponse, EntryModelData>> getEntry() async {
    const String url = '/api/collections/entry/records';

    final response = await myHttpClient.get(url: url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = response.data;

      final entryResponseModel = EntryModelData.fromJson(body);

      return (null, entryResponseModel);
    } else {
      final Map<String, dynamic> body = response.data;

      final loginErrorResponse = ErrorResponse.fromJson(body);

      return (loginErrorResponse, null);
    }
  }
}

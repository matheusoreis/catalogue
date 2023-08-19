import 'package:http/http.dart' as http;

abstract interface class IHttpClient {
  Future? get({
    required String url,
    Map<String, String>? headers,
  }) {
    return null;
  }

  Future? post({
    required String url,
    required dynamic body,
    required Map<String, String> headers,
  }) {
    return null;
  }
}

class MyHttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future get({
    required String url,
    Map<String, String>? headers,
  }) async {
    return await client.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  @override
  Future? post({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    return await client.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
  }
}

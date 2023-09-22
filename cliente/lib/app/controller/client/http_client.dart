import 'package:catalogue/app/shared/api_url.dart';
import 'package:dio/dio.dart';

abstract interface class IHttpClient {
  Future<Response> get({
    required String url,
    Map<String, String>? headers,
    Map<String, String>? query,
  });

  Future<Response> post({
    required String url,
    required dynamic body,
    required Map<String, String> headers,
  });
}

class MyHttpClient implements IHttpClient {
  final client = Dio(
    BaseOptions(
      baseUrl: apiURL,
    ),
  );

  @override
  Future<Response> get({required String url, Map<String, String>? headers, Map<String, String>? query}) async {
    return await client.get(
      url,
      queryParameters: query,
      options: Options(
        headers: headers,
      ),
    );
  }

  @override
  Future<Response> post({required String url, required dynamic body, Map<String, String>? headers}) async {
    return await client.post(
      url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );
  }
}

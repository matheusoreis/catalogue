class ErrorResponse {
  int code;
  String message;
  Map<String, dynamic> data;

  ErrorResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}

class ErrorResponseMessage {
  String code;
  String message;

  ErrorResponseMessage({
    required this.code,
    required this.message,
  });
}

class BaseResponse {
  final int code;
  final String message;
  final dynamic data;

  const BaseResponse({
    required this.code,
    required this.message,
    this.data,
  });

  BaseResponse.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        message = json["message"],
        data = json["data"];
}

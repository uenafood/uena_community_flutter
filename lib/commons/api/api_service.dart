import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:uena_community_flutter/commons/api/base_response.dart';
import 'package:uena_community_flutter/commons/constants.dart';

enum HttpMethod { get, post, put }

class APIService {
  static final Dio _dio = Dio();

  static Future<void> fetch(
    String endpoint, {
    HttpMethod httpMethod = HttpMethod.get,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    required Function(BaseResponse response) onSuccess,
    required Function(String error) onFailure,
  }) async {
    final requestEndpoint = Constants.host + endpoint;
    final requestBody = body ?? {};
    final requestQueryParameters = queryParameters ?? {};

    try {
      final Response result = await _dio.request(
        endpoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          method: httpMethod.name.toUpperCase(),
        ),
      );

      final response = BaseResponse.fromJson(result.data);

      if (kDebugMode) {
        print("REQ from $requestEndpoint:");
        print("REQ QUERY PARAMS :${json.encode(requestQueryParameters)}");
        print("REQ BODY : ${json.encode(requestBody)}");
        print("RESPONSE : ${json.encode(response)}");
      }

      onSuccess(response);
    } catch (e) {
      if (e is DioException) {
        if (e.type != DioExceptionType.cancel) {
          onFailure(e.type == DioExceptionType.connectionTimeout ||
                  e.type == DioExceptionType.connectionError ||
                  e.type == DioExceptionType.sendTimeout ||
                  e.type == DioExceptionType.receiveTimeout
              ? "Mohon cek jaringan kamu dan coba lagi."
              : "Sedang ada masalah pada server kami, cobalah beberapa saat lagi");
        } else {
          onFailure(e.toString());
        }
      }
    }
  }
}

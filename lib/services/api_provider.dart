import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:loyalty_card/core/constants/constants.dart';
import 'package:loyalty_card/core/enums/enums.dart';
import 'package:loyalty_card/core/failures/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResponseData {
  ResponseData({
    required this.data,
    required this.isSuccessful,
  });

  dynamic data;
  bool isSuccessful;
}

class ApiProvider {
  ApiProvider(this._client) {
    baseUrl = Constants.baseUrl;
  }

  final Dio _client;

  String? baseUrl;

  Future<ResponseData> launchRequest(
      {String? baseUrl,
      required String endPoint,
      required String method,
      dynamic body,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParams,
      CancelToken? cancelToken,
      isFromData = false}) async {
    var url = (baseUrl ?? this.baseUrl!) + endPoint;

    final sharedPreferences = await SharedPreferences.getInstance();

    var locale = sharedPreferences.getString("locale");

    var headersWithContentType = {
      "content-type": "application/json",
      "x-user-language": locale == "en" ? "EN" : "FR",
    };

    if (headers != null) {
      headersWithContentType.addAll(headers);
    }

    try {
      switch (method.toUpperCase()) {
        case "GET":
          var response = await _client.get(url,
              queryParameters: queryParams,
              options: Options(headers: headersWithContentType),
              cancelToken: cancelToken);

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }

        case "POST":
          var response = await _client.post(url,
              data: isFromData ? FormData.fromMap(body!) : jsonEncode(body),
              queryParameters: queryParams,
              options: Options(headers: headersWithContentType),
              cancelToken: cancelToken);

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }

        case "PUT":
          var response = await _client.put(url,
              data: isFromData ? FormData.fromMap(body!) : jsonEncode(body),
              options: Options(headers: headersWithContentType),
              queryParameters: queryParams,
              cancelToken: cancelToken);

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }

        case "DELETE":
          var response = await _client.delete(url,
              options: Options(headers: headersWithContentType),
              queryParameters: queryParams,
              cancelToken: cancelToken);

          if (response.statusCode == 200 || response.statusCode == 201) {
            return ResponseData(data: response.data, isSuccessful: true);
          } else {
            return ResponseData(data: response.data, isSuccessful: false);
          }
        default:
          return ResponseData(data: {}, isSuccessful: false);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw ErrorTypes.timeout;
      } else if (e.error is SocketException) {
        throw ErrorTypes.noConnectionInternet;
      } else {
        throw e.response?.data['message'] == null
            ? Failure('Invalid access token')
            : Failure(e.response?.data['message'] ?? "");
      }
    }
  }
}
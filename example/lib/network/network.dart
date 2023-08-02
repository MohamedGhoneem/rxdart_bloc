import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'http_method.dart';
export 'http_method.dart';
///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///

class Network {
  final String _baseUrl;

  Network(
    this._baseUrl,
  );

  final Dio _dio = Dio();

  Future<Response?> request(
    HttpMethod method, {
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    String url = '$_baseUrl$endpoint';
    Response response;
    try {
      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(url,
              queryParameters: queryParameters, options: _options(headers));
          log('$method ===>>> $endpoint ===>>> $response\n');
          return response;
        case HttpMethod.post:
          response =
              await _dio.post(url, data: body, options: _options(headers));
          log('$method ===>>> $endpoint ===>>> $response\n');
          return response;
        case HttpMethod.put:
          response =
              await _dio.put(url, data: body, options: _options(headers));
          log('$method ===>>> $endpoint ===>>> $response\n');
          return response;
        case HttpMethod.patch:
          response =
              await _dio.patch(url, data: body, options: _options(headers));
          log('$method ===>>> $endpoint ===>>> $response\n');
          return response;
        case HttpMethod.delete:
          response = await _dio.delete(url,
              queryParameters: queryParameters, options: _options(headers));
          log('$method ===>>> $endpoint ===>>> $response\n');
          return response;
        default:
          throw {
            "status_code": 500,
            "message": "Invalid request method",
            "errors": {
              "errors": ["Invalid request method"]
            }
          };
      }
    } on DioException catch (e) {
      log('$method ===>>> $endpoint ===>>> ${e.message}\n');

      if (e.response?.data == null || e.response?.data is String) {
        throw {
          "status_code": 500,
          "message": e.message,
          "errors": {
            "errors": [e.message]
          }
        };
      }
      throw e.response?.data;
    } on SocketException catch (e) {
      log('$method ===>>> $endpoint ===>>> ${e.message}\n');
      throw {
        "status_code": 500,
        "message": e.message,
        "errors": {
          "errors": [e.message]
        }
      };
    } catch (e) {
      log('$method ===>>> $endpoint ===>>> ${e.toString()}\n');
      throw {
        "status_code": 500,
        "message": e.toString(),
        "errors": {
          "errors": [e.toString()]
        }
      };
    }
    // }
  }

  Options _options(Map<String, dynamic>? headers) {
    Map<String, dynamic>? baseHeaders = {
      'Accept': 'application/json',
    };
    if (headers == null || headers.isEmpty) {
      log('headers : $baseHeaders');
      return Options(
          sendTimeout: const Duration(seconds: 5), // 5 seconds
          receiveTimeout: const Duration(seconds: 5), // 5 seconds
          headers: baseHeaders);
    } else {
      log('headers : $headers');
      return Options(
          sendTimeout: const Duration(seconds: 5), // 5 seconds
          receiveTimeout: const Duration(seconds: 5), // 5 seconds
          headers: headers);
    }
  }
}

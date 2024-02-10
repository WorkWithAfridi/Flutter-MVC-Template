import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide FormData, Response;

import '../../core/constants/api_endpoints.dart';
import '../../core/helper/logger.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class NetworkController extends GetxController {
  Dio? _dio;

  static header() => {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

  Future<NetworkController> init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        headers: header(),
      ),
    );
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          logger.i("REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          logger.i("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          logger.i("Error[${err.response?.statusCode}]");
          return handler.next(err);
        },
      ),
    );
  }

  Future<dynamic> request({required String url, required Method method, params, String? authToken}) async {
    try {
      final response = await compute(_performHttpRequest, {
        'url': url,
        'method': method,
        'params': params,
        'authToken': authToken,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else if (response.statusCode == 422) {
        return Get.snackbar('Opps', response.data['message']);
      } else {
        throw Exception("Something went wrong");
      }
    } on SocketException catch (e) {
      logger.e(e);
      Get.snackbar('Opps', "No Internet Connection");
      throw Exception("No Internet Connection");
    } on FormatException catch (e) {
      logger.e(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      logger.e(e);
      handleDioError(e);
      throw Exception(e);
    } catch (e) {
      logger.e(e);
      throw Exception("Something went wrong");
    }
  }

  static Future<Response> _performHttpRequest(Map<String, dynamic> data) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        headers: header(),
      ),
    );

    final url = data['url'];
    final method = data['method'];
    final params = data['params'];
    final authToken = data['authToken'];

    try {
      Response response;

      switch (method) {
        case Method.POST:
          response = await dio.post(url, data: params, options: Options(headers: {"Authorization": "Bearer $authToken"}));
          break;
        case Method.DELETE:
          response = await dio.delete(url);
          break;
        case Method.PATCH:
          response = await dio.patch(url);
          break;
        default:
          response = await dio.get(url, queryParameters: params, options: Options(headers: {"Authorization": "Bearer $authToken"}));
          break;
      }

      return response;
    } on DioError catch (e) {
      handleDioError(e);
      throw Exception(e);
    }
  }

  static void handleDioError(DioError e) {
    logger.e(e);
    if (e.type == DioErrorType.other) {
      Get.snackbar('Opps', "There is no internet connection");
    } else if (e.type == DioErrorType.cancel) {
      Get.snackbar('Opps', "Request to API server was cancelled");
    } else if (e.type == DioErrorType.connectTimeout) {
      Get.snackbar('Opps', "Connection timeout with API server");
    } else if (e.type == DioErrorType.receiveTimeout) {
      Get.snackbar('Opps', "Receive timeout in connection with API server");
    } else if (e.type == DioErrorType.sendTimeout) {
      Get.snackbar('Opps', "Send timeout in connection with API server");
    } else if (e.type == DioErrorType.response) {
      if (e.response?.statusCode == 401) {
        Get.snackbar('Opps', "Your session is over, please sign in");
      } else {
        logger.d(e.response);
        Get.snackbar('Opps', e.response?.data['message']);
      }
    }
  }
}

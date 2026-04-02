import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:preprx/services/data/app_exception.dart';
import 'package:preprx/services/data/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  late final Dio _dio;

  NetworkApiServices() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
  }

  @override
  Future<dynamic> getApi(String url, String? token) async {
    dynamic responseJson;

    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Accept': 'application/json',
            if (token != null) 'Authorization': 'Bearer ${token.trim()}',
          },
        ),
      );

      responseJson = returnResponse(response);
    } on DioException catch (e) {
      _handleDioException(e);
    } on AppExceptions {
      rethrow;
    } catch (e) {
      throw FetchDataException('$e');
    }

    if (kDebugMode) {
      log('GET Response: $responseJson');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(
    dynamic data,
    String url,
    String? token, {
    bool isJson = true,
    List<File>? files,
    List<String>? fileFields,
  }) async {
    if (kDebugMode) {
      log("POST URL: $url");
      log("POST Data: $data");
      log(
        "Content-Type: ${isJson ? 'application/json' : 'multipart/form-data'}",
      );
      log("File Fields: $fileFields");
      if (token != null) log("Authorization: Bearer ${token.trim()}");
    }

    dynamic responseJson;

    try {
      if (isJson) {
        final response = await _dio.post(
          url,
          data: jsonEncode(data),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              if (token != null) 'Authorization': 'Bearer ${token.trim()}',
            },
          ),
        );

        responseJson = returnResponse(response);
      } else if (files != null && files.isNotEmpty) {
        final formData = FormData();

        // Add text fields
        if (data is Map) {
          data.forEach((key, value) {
            formData.fields.add(MapEntry(key, value.toString()));
            log("Adding text field: $key = $value");
          });
        }

        // Validate fileFields length
        if (fileFields != null && fileFields.length != files.length) {
          log(
            "Warning: fileFields length (${fileFields.length}) does not match files length (${files.length})",
          );
        }

        // Add files
        for (int i = 0; i < files.length; i++) {
          final file = files[i];
          final fieldName = fileFields != null && i < fileFields.length
              ? fileFields[i]
              : 'image_$i';

          formData.files.add(
            MapEntry(
              fieldName,
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
          log("Adding file field: $fieldName = ${file.path}");
        }

        final response = await _dio.post(
          url,
          data: formData,
          options: Options(
            headers: {
              'Accept': 'application/json',
              if (token != null) 'Authorization': 'Bearer ${token.trim()}',
            },
          ),
        );

        responseJson = returnResponse(response);
      } else {
        final response = await _dio.post(
          url,
          data: data is Map
              ? data.map((k, v) => MapEntry(k, v.toString()))
              : data,
          options: Options(
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
              'Accept': 'application/json',
              if (token != null) 'Authorization': 'Bearer ${token.trim()}',
            },
          ),
        );

        responseJson = returnResponse(response);
      }
    } on DioException catch (e) {
      _handleDioException(e);
    } on AppExceptions {
      rethrow;
    } catch (e) {
      throw FetchDataException('$e');
    }

    return responseJson;
  }

  @override
  Future<dynamic> putApi(
    dynamic data,
    String url,
    String? token, {
    bool isJson = true,
  }) async {
    if (kDebugMode) {
      log("PUT URL: $url");
      log("PUT Data: $data");
      log(
        "Content-Type: ${isJson ? 'application/json' : 'application/x-www-form-urlencoded'}",
      );
      if (token != null) log("Authorization: Bearer ${token.trim()}");
    }

    dynamic responseJson;

    try {
      final response = await _dio.put(
        url,
        data: isJson
            ? jsonEncode(data)
            : data is Map
            ? data.map((k, v) => MapEntry(k, v.toString()))
            : data,
        options: Options(
          headers: {
            'Content-Type': isJson
                ? 'application/json'
                : 'application/x-www-form-urlencoded',
            'Accept': 'application/json',
            if (token != null) 'Authorization': 'Bearer ${token.trim()}',
          },
        ),
      );

      responseJson = returnResponse(response);
    } on DioException catch (e) {
      _handleDioException(e);
    } on AppExceptions {
      rethrow;
    } catch (e) {
      throw FetchDataException('$e');
    }

    return responseJson;
  }

  @override
  Future<dynamic> deleteApi(String url, String? token) async {
    if (kDebugMode) {
      log("DELETE URL: $url");
      if (token != null) log("Authorization: Bearer ${token.trim()}");
    }

    dynamic responseJson;

    try {
      final response = await _dio.delete(
        url,
        options: Options(
          headers: {
            'Accept': 'application/json',
            if (token != null) 'Authorization': 'Bearer ${token.trim()}',
          },
        ),
      );

      responseJson = returnResponse(response);
    } on DioException catch (e) {
      _handleDioException(e);
    } on AppExceptions {
      rethrow;
    } catch (e) {
      throw FetchDataException('$e');
    }

    if (kDebugMode) {
      log("DELETE Response: $responseJson");
    }

    return responseJson;
  }

  dynamic returnResponse(Response response) {
    dynamic responseJson;
    try {
      responseJson = response.data;
      log("Full response JSON: $responseJson");
    } catch (e) {
      throw FetchDataException('Failed to parse response: ${response.data}');
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson['message'] ?? 'Bad request');
      case 401:
        throw TokenExpiredException(
          responseJson['message'] ?? 'Session expired. Please login again.',
        );
      case 403:
        throw UnAuthorizedException(
          responseJson['message'] ??
              'Account deactivated. Please contact admin.',
        );
      case 404:
        throw UnAuthorizedException(responseJson['message'] ?? 'Not Found');
      case 429:
        throw UnAuthorizedException(
          responseJson['message'] ?? 'Too Many Requests',
        );
      case 408:
        throw RequestTimeOutException(
          responseJson['message'] ?? 'Request Timed Out',
        );
      case 500:
        throw ServerException(
          responseJson['message'] ?? 'Internal Server Error',
        );
      default:
        throw FetchDataException(responseJson['message'] ?? '');
    }
  }

  void _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw RequestTimeOutException('Request timed out');
      case DioExceptionType.connectionError:
        throw InternetException('No Internet connection');
      case DioExceptionType.badResponse:
      case DioExceptionType.badCertificate:
        // Handle bad response
        break;
      case DioExceptionType.cancel:
        throw FetchDataException('Request cancelled');
      case DioExceptionType.unknown:
        throw FetchDataException(e.toString());
    }
  }
}

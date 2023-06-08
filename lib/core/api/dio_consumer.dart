import 'dart:convert';
import 'dart:io';
//import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:store_app/core/api/api_helper.dart';
import 'package:store_app/core/api/app_endpoits.dart';
import 'package:store_app/core/api/dio_interceptors.dart';
import 'package:store_app/core/utils/injection.dart';
import 'exceptions.dart';
import 'statuscode.dart';

class DioConsumer implements ApiHelper {
  Dio client;
  DioConsumer({required this.client}) {
    client.httpClientAdapter = IOHttpClientAdapter(
      onHttpClientCreate: (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
        return client;
      },
    );

    /* (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    }; */
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) => status! < StatusCode.internalServerError;

    client.interceptors.add(getIt<DioInterceptor>());
    if (kDebugMode) {
      client.interceptors.add(getIt<LogInterceptor>());
    }
  }

  @override
  Future postData(
      {required String url,
      required Map<String, dynamic> data,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.post(url,
          data: formDataIsEnabled ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      return handleDioError(error);
    }
  }

  @override
  Future getData(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(url, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      return handleDioError(error);
    }
  }

  @override
  Future putData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.put(url, data: data, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      return handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.badCertificate:
        throw const BadCertificateException();
      case DioErrorType.badResponse:
        throw const BadResponseException();
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectionError:
        throw NoInternetConnectionException();
      case DioErrorType.unknown:
        throw NoInternetConnectionException();
    }
    /* switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw InternalServerException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw NoInternetConnectionException();
    } */
  }

  @override
  Future deleteData(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.delete(url);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      return handleDioError(error);
    }
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:muapp/core/interceptor/retry_interceptor.dart';
import '../../constants/api_const/api_const.dart';
import '../../main.dart';
import 'auth_interceptor.dart';
import 'connectivity_retry_interceptor.dart';

class Api {
  final dio = createDio();

  // final tokenDio = Dio(BaseOptions(baseUrl: AppAPI.BaseUrl));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio();
    dio.options.baseUrl = AppAPI.baseUrl;
    dio.interceptors
    ..add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        request: true,
        requestBody: true))
      // ..add(AuthInterceptor(dio))
      ..add(AppInterceptors(dio))
      ..add(
        RetryOnConnectionChangeInterceptor(
          requestRetrier: DioConnectivityRequestRetrier(
              dio: dio, connectivity: Connectivity()),
        ),
      );
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            // showAwesomeDialogue(title: "Error", content: "Please log out and login again", type: DialogType.ERROR);
            break;
          case 401:
            // showAwesomeDialogue(title: "Error", content: "Please log out and login again", type: DialogType.ERROR);
            break;
          case 404:
            // showAwesomeDialogue(title: "Error", content: "Please log out and login again", type: DialogType.ERROR);
            break;
          case 409:
            // showAwesomeDialogue(title: "Error", content: "Please log out and login again", type: DialogType.ERROR);
            break;
          case 500:
            // showAwesomeDialogue(title: "Error", content: "Please try again later", type: DialogType.ERROR);
            break;
          case 502:
            // showAwesomeDialogue(title: "Error", content: "Please try again later", type: DialogType.ERROR);
            break;
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        const SnackBar snackBar = SnackBar(
            backgroundColor: Colors.red, content: Text("No Internet Connection"));
        snackbarKey.currentState?.showSnackBar(snackBar);
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
    }
    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
   }
}
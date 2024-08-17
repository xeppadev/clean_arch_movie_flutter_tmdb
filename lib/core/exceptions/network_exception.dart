import 'dart:io';

import 'package:clean_arch_movie_flutter/core/network/model/error_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// Manejo de excepciones de red personalizadas basadas en DioException
class NetworkException extends Equatable implements Exception {
  late final String message;
  late final int? statusCode;

  //Constructor personalizado para manejar las excepciones de red de Dio tenindo en cuenta el tipo de error
  NetworkException.fromDioError(DioException dioException) {
    statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioException.error.runtimeType == SocketException) {
          message = 'Please check your internet connection';
          break;
        } else {
          message = 'Unexpected error occurred';
          break;
        }

      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;

      case DioExceptionType.badResponse:
        final model = NetworkErrorModel.fromJson(dioException.response?.data as Map<String, dynamic>);
        message = model.statusMessage ?? 'Unexpected bad response';
        break;

      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
    }
  }

  @override
  List<Object?> get props => [message, statusCode];
}

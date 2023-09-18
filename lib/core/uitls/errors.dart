import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send Timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('recevie Timeout with api server');
      case DioExceptionType.badResponse:
        return ServerFailure('oops there is an error with api server');
      case DioExceptionType.cancel:
        return ServerFailure('request with api server is cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet Connection');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with api server');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown with api server');
    }
  }
}

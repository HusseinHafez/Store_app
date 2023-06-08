import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store_app/store_app.dart';


class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);
  @override
  List<Object?> get props => [message];
  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([message]) : super("Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super("Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super("Unauthorized");

  //Go to login Page
}
class BadResponseException extends ServerException{
  const BadResponseException([message]):super('bad response');
}

class BadCertificateException extends ServerException{
  const BadCertificateException([message]):super('bad certificate');
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super("Requested Info Not Found");
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super("Confilct Occurred");
}

class InternalServerException extends ServerException {
  InternalServerException([message]) : super("Internet Server Error") {
    Fluttertoast.showToast(msg: "SomeThing went Wrong, Please try again later");
  }
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message]) : super("No Internet Connection") {
    StoreApp.navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const Scaffold()//NoNetworkScreen(),
        ),
        (route) => false);
  }
}

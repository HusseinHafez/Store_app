import 'package:dartz/dartz.dart';
import 'package:store_app/core/api/exceptions.dart';

abstract class LoginRepo {
  Future<Either<ServerException, Map<String,dynamic>>> postData(
      {required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters});
}

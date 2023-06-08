import 'package:dartz/dartz.dart';
import 'package:store_app/core/api/exceptions.dart';

abstract class RegisterRepo{

  Future<Either<ServerException,dynamic>> postData ({required Map<String,dynamic> data ,Map<String,dynamic>?queryParameters});
}
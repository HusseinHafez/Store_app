import 'package:dartz/dartz.dart';
import 'package:store_app/core/api/exceptions.dart';
import 'package:store_app/modules/Register/model/user_model.dart';

abstract class ProfileRepo{

  Future<Either<ServerException,UserModel>> getData();
}
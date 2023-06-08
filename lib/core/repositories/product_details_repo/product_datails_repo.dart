import 'package:dartz/dartz.dart';
import 'package:store_app/core/api/exceptions.dart';

abstract class ProductDetailsRepo{


  
  Future<Either<ServerException,dynamic>>deleteData({required String productId});
}
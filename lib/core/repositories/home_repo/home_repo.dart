import 'package:dartz/dartz.dart';
import 'package:store_app/core/api/exceptions.dart';
import 'package:store_app/modules/home/model/products.dart';

abstract class HomeRepo{

  Future<Either<ServerException,List<ProductModel>>> getData();
  Future<Either<ServerException,ProductModel>> postData({required ProductModel product});
}
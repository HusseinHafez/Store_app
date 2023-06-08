import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/api/app_endpoits.dart';
import 'package:store_app/core/api/dio_consumer.dart';
import 'package:store_app/core/api/exceptions.dart';
import 'package:store_app/core/repositories/product_details_repo/product_datails_repo.dart';

class ProductDetailsRepoImple implements ProductDetailsRepo {
  final DioConsumer dio;
  ProductDetailsRepoImple({required this.dio});
  @override
  Future<Either<ServerException, dynamic>> deleteData(
      {required String productId}) async {
    try {
      final response =
          await dio.deleteData(url: EndPoints.allProduct + productId);
      return right(response);
    } catch (error) {
      if (error is DioError) {
        return left(dio.handleDioError(error));
      } else {
        return left(ServerException(error.toString()));
      }
    }
  }

 
}


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/api/app_endpoits.dart';
import 'package:store_app/core/api/dio_consumer.dart';
import 'package:store_app/core/api/exceptions.dart';
import 'package:store_app/core/repositories/register_repo/register_repo.dart';

class RegisterRepoImple implements RegisterRepo {
  final DioConsumer dio;
  RegisterRepoImple({required this.dio});

  @override
  Future<Either<ServerException, dynamic>> postData(
      {
      required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.postData(url: EndPoints.registeruser, data: data,queryParameters: queryParameters,);
      return right(response);
    } catch (error) {
      if (error is DioError) {
        return left(
          dio.handleDioError(error),
        );
      } else {
        return left(
          ServerException(
            error.toString(),
          ),
        );
      }
    }
  }
}

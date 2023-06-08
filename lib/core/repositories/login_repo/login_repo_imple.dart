import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/api/app_endpoits.dart';
import 'package:store_app/core/api/dio_consumer.dart';
import 'package:store_app/core/api/exceptions.dart';
import 'package:store_app/core/repositories/login_repo/login_repo.dart';

class LoginRepoImple implements LoginRepo {
  final DioConsumer dio;
  LoginRepoImple({required this.dio});
  @override
  Future<Either<ServerException, Map<String, dynamic>>> postData(
      {required Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.postData(
        url: EndPoints.loginUser,
        data: data,
        queryParameters: queryParameters,
      );
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

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/api/app_endpoits.dart';
import 'package:store_app/core/api/dio_consumer.dart';
import 'package:store_app/core/api/exceptions.dart';
import 'package:store_app/core/repositories/profile_repo/profile_repo.dart';
import 'package:store_app/modules/Register/model/user_model.dart';

class ProfileRepoImple implements ProfileRepo {
  final DioConsumer dio;
  ProfileRepoImple({required this.dio});

  @override
  Future<Either<ServerException, UserModel>> getData() async {
    try {
      final response = await dio.getData(url: EndPoints.profile);
      return right(
        UserModel.fromJson(response),
      );
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

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/core/api/app_endpoits.dart';
import 'package:store_app/core/api/dio_consumer.dart';
import 'package:store_app/core/api/exceptions.dart';
import 'package:store_app/core/repositories/cart_repo/cart_repo.dart';
import 'package:store_app/modules/cart/model/cart_item.dart';
import 'package:store_app/modules/cart/model/cart_model.dart';
import 'package:store_app/modules/home/model/products.dart';

class CartRepoImple implements CartRepo {
  final DioConsumer dio;
  CartRepoImple({required this.dio});
  List<Products> cartProducts = [];
  List<CartItemModel> allCartItems = [];
  List<CartModel> allCart = [];
  @override
  Future<Either<ServerException, List<CartModel>>> getAllCart() async {
    try {
      final response = await dio.getData(url: EndPoints.allCart);

      for (var e in response) {
        allCart.add(CartModel.fromJson(e));
      }
      return right(allCart);
    } catch (error) {
      if (error is DioError) {
        return left(dio.handleDioError(error));
      } else {
        return left(ServerException(error.toString()));
      }
    }
  }

  @override
  Future<Either<ServerException, ProductModel>> getAllCartProductDetails(
      {required String productId}) async {
    try {
      final response =
          await dio.getData(url: EndPoints.singleProduct + productId);
      return right(ProductModel.fromJson(response));
    } catch (error) {
      if (error is DioError) {
        return left(dio.handleDioError(error));
      } else {
        return left(ServerException(error.toString()));
      }
    }
  }
  
}

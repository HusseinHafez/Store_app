import 'package:dartz/dartz.dart';
import 'package:store_app/core/api/exceptions.dart';
import 'package:store_app/modules/cart/model/cart_model.dart';
import 'package:store_app/modules/home/model/products.dart';

abstract class CartRepo{

  Future<Either<ServerException,List<CartModel>>> getAllCart();
  Future<Either<ServerException,ProductModel>> getAllCartProductDetails({required String productId});
}
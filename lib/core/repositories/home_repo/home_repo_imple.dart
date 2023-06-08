

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/api/app_endpoits.dart';
import 'package:store_app/core/api/dio_consumer.dart';
import 'package:store_app/core/api/exceptions.dart';
import 'package:store_app/modules/home/model/products.dart';

import 'home_repo.dart';

class HomeRepoImple implements HomeRepo {
  final DioConsumer dio;
  HomeRepoImple({required this.dio});

  @override
  Future<Either<ServerException, List<ProductModel>>> getData() async{
    try{
      final response = await dio.getData(url: EndPoints.allProduct);
      List<ProductModel> products=[];
      for(var product in response){
        products.add(ProductModel.fromJson(product));
      }
      return right(products);
    }catch(error){
      debugPrint(error.toString());
     if(error is DioError){
      return left(dio.handleDioError(error));
     }else{
      return left(ServerException(error.toString()));
     }
    }
  }

  Future<Either<ServerException, List<ProductModel>>> getProductsInSingleCategory({required String url}) async{
    try{
      final response = await dio.getData(url: url);
      List<ProductModel> products=[];
      for(var product in response){
        products.add(ProductModel.fromJson(product));
      }
      return right(products);
    }catch(error){
      debugPrint(error.toString());
     if(error is DioError){
      return left(dio.handleDioError(error));
     }else{
      return left(ServerException(error.toString()));
     }
    }
  }

  Future<Either<ServerException, List<String>>> getGategories() async{
    try{
      final response = await dio.getData(url: EndPoints.allCategories);
      List<String> categories=[];
      for(var category in response){
        categories.add(category);
      }
      return right(categories);
    }catch(error){
      debugPrint(error.toString());
     if(error is DioError){
      return left(dio.handleDioError(error));
     }else{
      return left(ServerException(error.toString()));
     }
    }
  }
  
  @override
  Future<Either<ServerException, ProductModel>> postData({required ProductModel product}) async {
  try{
    final response = await dio.postData(url: EndPoints.allProduct, data: product.toJson());
     return right(response);
  }catch(error){
    debugPrint(error.toString());
    if(error is DioError){
      return left(dio.handleDioError(error));
    }else{
      return left(ServerException(error.toString()));
    }
  }
  }

  /* @override
  Future getData({String url = EndPoints.allProduct}) async {
    final response =  await dio.getData(url: url);
   return response;
  } */
}

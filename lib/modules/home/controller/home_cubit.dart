import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/api/app_endpoits.dart';
import 'package:store_app/core/repositories/home_repo/home_repo_imple.dart';

import '../model/products.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepoImple}) : super(HomeInitial());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);
  final HomeRepoImple homeRepoImple;
  bool isLoading = false;
  List<ProductModel> allProducts = [];

  getAllProducts() async {
    isLoading=true;
    emit(GetAllProductLoadingState());
    final response = await homeRepoImple.getData();
    response.fold((l) {
      isLoading=false;
      emit(GetAllProductErrorState());
    }, (r) {
      isLoading=false;
      allProducts=r;
      emit(GetAllProductSucessState());
    });
   /*  allProducts = [];
    isLoading = true;
    emit(LoadingState());
    await homeRepoImple.getData().then((value) {
      isLoading = false;
      for (var e in value) {
        allProducts.add(ProductModel.fromJson(e));
      }
      emit(GetAllProductSucessState());
    }).catchError((error) {
      isLoading = false;
      Fluttertoast.showToast(msg: error.toString());
      print(error.toString());
      emit(GetAllProductErrorState());
    }); */
  }
  

   bool allCategoriesLoading=false;
    List<String> allCategories=[]; 
    getAllCategories()async{
      allCategoriesLoading=true;
      emit(GetAllCategoriesLoadinState());
      final response = await homeRepoImple.getGategories();
      response.fold((l) {
        allCategoriesLoading=false;
        emit(GetAllCategoriesErrorState());
      }, (r) {
        allCategoriesLoading=false;
        allCategories=r;
        emit(GetAllCategoriesSucessState());
      });
    }

    bool jeweleryProductsLoading=false;
    List<ProductModel> jeweleryProducts=[];
    getJeweleryProducts() async{
      jeweleryProductsLoading=true;
      emit(GetJeweleryProductsLoadinState());
      final response=await homeRepoImple.getProductsInSingleCategory(url: EndPoints.jeweleryProducts);
      response.fold((l) {
        jeweleryProductsLoading=false;
        emit(GetJewleryProductsErrorState());
      }, (r) {
        jeweleryProductsLoading=false;
        jeweleryProducts=r;
        emit(GetJeweleryProductsSucessState());
      });

  
    }


    bool electronicsProductsLoading=false;
    List<ProductModel> electronicsProducts=[];
    getElectronicsProducts() async{
      electronicsProductsLoading=true;
      emit(GetElectronicsProductsLoadinState());
      final response=await homeRepoImple.getProductsInSingleCategory(url: EndPoints.electronicsProducts);
      response.fold((l) {
        electronicsProductsLoading=false;
        emit(GetElectronicsProductsErrorState());
      }, (r) {
        electronicsProductsLoading=false;
        electronicsProducts=r;
        emit(GetElectronicsProductsSucessState());
      });
    }
    

     bool menClothesProductsLoading=false;
    List<ProductModel> menClothesProducts=[];
    getMenClothesProducts() async{
      menClothesProductsLoading=true;
      emit(GetMenClothesProductsLoadinState());
      final response=await homeRepoImple.getProductsInSingleCategory(url: EndPoints.menClothesProducts);
      response.fold((l) {
        menClothesProductsLoading=false;
        emit(GetMenClothesProductsErrorState());
      }, (r) {
        menClothesProductsLoading=false;
        menClothesProducts=r;
        emit(GetMenClothesProductsSucessState());
      });
    }
     bool womenClothesProductsLoading=false;
    List<ProductModel> womenClothesProducts=[];
    getWomenClothesProducts() async{
      womenClothesProductsLoading=true;
      emit(GetWomenClothesProductsLoadinState());
      final response=await homeRepoImple.getProductsInSingleCategory(url: EndPoints.womenClothesProducts);
      response.fold((l) {
        womenClothesProductsLoading=false;
        emit(GetWomenClothesProductsErrorState());
      }, (r) {
        womenClothesProductsLoading=false;
        womenClothesProducts=r;
        emit(GetWomenClothesProductsSucessState());
      });
    }
    
}

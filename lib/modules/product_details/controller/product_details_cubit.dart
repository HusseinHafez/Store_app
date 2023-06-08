import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/repositories/product_details_repo/product_details_repo_imple.dart';
import 'package:store_app/modules/home/view/home_screen.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit({required this.productDetailsRepoImple})
      : super(ProductDetailsInitial());
  final ProductDetailsRepoImple productDetailsRepoImple;
  static ProductDetailsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  

  bool deleteProductIsLoading = false;
  deleteProduct(
      {required String productId, required BuildContext context}) async {
    deleteProductIsLoading = true;
    emit(DeleteProductIsLoadingState());
    final response =
        await productDetailsRepoImple.deleteData(productId: productId);
    response.fold((l) {
      deleteProductIsLoading = false;
      emit(DeleteProductErrorState());
    }, (r) {
      deleteProductIsLoading = false;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
      emit(DeleteProductSucessState());
    });
  }
}

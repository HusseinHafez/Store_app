import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/repositories/cart_repo/cart_repo_imple.dart';
import 'package:store_app/modules/cart/model/cart_item.dart';
import 'package:store_app/modules/cart/model/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({
    required this.cartRepoImple,
  }) : super(CartInitial());
  final CartRepoImple cartRepoImple;
  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  bool getAllCartIsLoading = false;
  List<CartModel> cartProducts = [];
  List<Products> listofProducts = [];
  getAllCart() async {
    getAllCartIsLoading = true;
    emit(GetAllCartIsLoadingState());
    final response = await cartRepoImple.getAllCart();

    response.fold((l) {
      getAllCartIsLoading = false;
      emit(GetAllCartErrorState());
    }, (r) async{
      getAllCartIsLoading = false;

      cartProducts = r;
     // debugPrint('List of Cart Products : $cartProducts');
      for (var e in cartProducts) {
        for (var element in e.products!) {
          listofProducts.add(element);
        }
      }
     // debugPrint('List of Porducts : $listofProducts');
      await getAllCartProductDetails();
      emit(GetAllCartSucessState());
    });
  }

  bool getAllCartProductDetailsIsLoading = false;
  List<CartItemModel> prods = [];
  getAllCartProductDetails() async {
    getAllCartProductDetailsIsLoading = true;
    emit(GetAllProductInCartIsLoadingState());
    for (int i=0;i<listofProducts.length;i++) {
      final response = await cartRepoImple.getAllCartProductDetails(
          productId: listofProducts[i].productId.toString());
      response.fold((l) {
        getAllCartProductDetailsIsLoading = false;
        emit(GetAllProductInCartErrorState());
      }, (r) {
        getAllCartProductDetailsIsLoading = false;
        prods.add(
          CartItemModel(
            productModel: r,
            quantity: listofProducts[i].quantity,
          ),
        );
      //  debugPrint('Prods : $prods');
        emit(GetAllProductInCartSucessState());
      });
    }
  }
}

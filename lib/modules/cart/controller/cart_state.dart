part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}


class GetAllCartIsLoadingState extends CartState{}
class GetAllCartSucessState extends CartState{}
class GetAllCartErrorState extends CartState{}


class GetAllProductInCartIsLoadingState extends CartState{}
class GetAllProductInCartSucessState extends CartState{}
class GetAllProductInCartErrorState extends CartState{}

class CartItemsIsLoadingState extends CartState{}
class CartItemsSucessState extends CartState{}
class CartItemsErrorState extends CartState{}
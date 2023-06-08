part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class GetAllProductLoadingState extends HomeState {}
class GetAllProductSucessState extends HomeState {}
class GetAllProductErrorState extends HomeState {}


class GetAllCategoriesLoadinState extends HomeState {}
class GetAllCategoriesSucessState extends HomeState {}
class GetAllCategoriesErrorState extends HomeState {}


class GetJeweleryProductsLoadinState extends HomeState {}
class GetJeweleryProductsSucessState extends HomeState {}
class GetJewleryProductsErrorState extends HomeState {}

class GetMenClothesProductsLoadinState extends HomeState {}
class GetMenClothesProductsSucessState extends HomeState {}
class GetMenClothesProductsErrorState extends HomeState {}

class GetWomenClothesProductsLoadinState extends HomeState {}
class GetWomenClothesProductsSucessState extends HomeState {}
class GetWomenClothesProductsErrorState extends HomeState {}

class GetElectronicsProductsLoadinState extends HomeState {}
class GetElectronicsProductsSucessState extends HomeState {}
class GetElectronicsProductsErrorState extends HomeState {}


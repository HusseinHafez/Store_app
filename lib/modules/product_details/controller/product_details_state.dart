part of 'product_details_cubit.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}



class DeleteProductIsLoadingState extends ProductDetailsState{}
class DeleteProductSucessState extends ProductDetailsState{}
class DeleteProductErrorState extends ProductDetailsState{}
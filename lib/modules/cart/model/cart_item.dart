import 'package:store_app/modules/home/model/products.dart';

class CartItemModel {
  final ProductModel productModel;
  final int? quantity;
  CartItemModel({
    required this.productModel,
    required this.quantity,
  });
}

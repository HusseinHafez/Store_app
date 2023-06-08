import 'package:flutter/material.dart';
import 'package:store_app/modules/home/model/products.dart';

import '../../../../core/component/product_item.dart';

class ElectronicsTab extends StatelessWidget {
  final List<ProductModel> products;
  const ElectronicsTab({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 13,
        mainAxisExtent: MediaQuery.of(context).size.height * .35,
        // childAspectRatio: 5/8
      ),
      itemBuilder: (context, index) => ProductItem(product: products[index]),
      itemCount: products.length,
    );
  }
}
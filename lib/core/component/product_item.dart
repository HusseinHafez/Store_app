import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/modules/home/model/products.dart';
import 'package:store_app/modules/product_details/view/product_details.dart';

import '../utils/app_colors.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(product: product),
          )),
      child: Badge(
        largeSize: 25,
        textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.topLeft,
        label: Text('${product.price.toString()}\t\$'),
        child: Material(
          elevation: 10,
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: AppColors.primaryColor.withOpacity(.5),
              title: Text(
                product.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'rating: ${product.rating!.rate.toString()}\nrate conut: ${product.rating!.count.toString()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  FontAwesomeIcons.cartShopping,
                  color: AppColors.whiteColor,
                  size: 20.w,
                ),
                onPressed: () {},
              ),
            ),
            child: Hero(
                tag: product.id.toString(),
                child: Image.network(product.image!)),
          ),
        ),
      ),
    );
  }
}

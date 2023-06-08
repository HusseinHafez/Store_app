import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/injection.dart';
import 'package:store_app/modules/product_details/controller/product_details_cubit.dart';
import '/core/component/auth_button.dart';
import '/core/utils/app_colors.dart';
import '/modules/home/model/products.dart';
import '/modules/product_details/view/widgets/advanced_row.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProductDetailsCubit>(),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          final controller = ProductDetailsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.blackColor,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    await controller.deleteProduct(
                      productId: product.id.toString(),
                      context: context,
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.redColor,
                  ),
                  tooltip: 'Delete',
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: product.id.toString(),
                    child: Image.network(
                      product.image.toString(),
                      height: 250.h,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    product.title.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(top: 20),
                      children: [
                        AdvancedRow(
                          text: 'Category',
                          value: product.category.toString(),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AdvancedRow(
                          text: 'Price:',
                          value: '${product.price.toString()}\$',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AdvancedRow(
                          text: 'Rate:',
                          value: product.rating!.rate.toString(),
                        ),
                        AdvancedRow(
                          text: 'Rating count:',
                          value: product.rating!.count.toString(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'description:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          product.description.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        AuthButton(
                          text: 'Add to cart',
                          onPressed: () {},
                          backgroundColor: AppColors.primaryColor,
                          textColor: AppColors.whiteColor,
                          vertical: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

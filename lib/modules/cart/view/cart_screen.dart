import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/component/app_drawer.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_constants.dart';
import 'package:store_app/core/utils/injection.dart';
import 'package:store_app/modules/cart/controller/cart_cubit.dart';
import 'package:store_app/modules/cart/view/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CartCubit>()..getAllCart(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final controller = CartCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              centerTitle: AppConstants.appbarCenterTitle,
              title: Text(
                'Cart',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            drawer: const AppDrawer(),
            body: controller.getAllCartProductDetailsIsLoading?const Center(
              child: CircularProgressIndicator(),
            ) :ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: AppColors.blackColor,
              ),
              itemBuilder: (context, index) {
                return CartItem(
                  cartItemModel: controller.prods[index],
                );
              },
              itemCount: controller.prods.length,
            ),
          );
        },
      ),
    );
  }
}

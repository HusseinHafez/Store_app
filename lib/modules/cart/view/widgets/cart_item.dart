import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/modules/cart/model/cart_item.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItemModel;
  const CartItem({
    super.key,
    required this.cartItemModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                   Image.network(
                  cartItemModel.productModel.image.toString(),
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.fill,
                ),SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Text(
                    cartItemModel.productModel.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                   Text(
                    'Price per one ${cartItemModel.productModel.price.toString()} \$',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                   Text(
                    'Quantity: ${cartItemModel.quantity.toString()}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                  
                    ],
                  ),
                ),
                     Text(
                    'Total: ${(cartItemModel.quantity)! * (cartItemModel.productModel.price!)}\$',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
              ],
             
                )
        
        
  
    );
  }
}

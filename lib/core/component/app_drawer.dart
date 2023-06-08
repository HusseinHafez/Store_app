import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/component/drawer_list_tile.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/injection.dart';
import 'package:store_app/core/utils/shared_pref.dart';
import 'package:store_app/modules/Login/view/login.dart';
import 'package:store_app/modules/cart/view/cart_screen.dart';
import 'package:store_app/modules/home/view/home_screen.dart';
import 'package:store_app/modules/profile/view/profile_screen.dart';

import '../utils/app_images.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: Column(
        children: [
          SizedBox(
            height: 170.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40.w,
                  backgroundColor:AppColors.orangeColor,
                  backgroundImage: const AssetImage(
                    AppImages.profile,
                  ),
                  foregroundImage: const AssetImage(
                    AppImages.profile,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'johnd',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'john@gmail.com',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20.sp,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: AppColors.whiteColor,
          ),
          DrawerListTile(
            icon: Icons.home,
            title: 'Home',
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false),
          ),
          DrawerListTile(
            icon: Icons.shopping_cart,
            title: 'Cart',
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
                (route) => false),
          ),
          DrawerListTile(
            icon: Icons.person,
            title: 'Profile',
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
                (route) => false),
          ),
           DrawerListTile(
            icon: Icons.exit_to_app,
            title: 'Logout',
            onTap: () {
              getIt<SharedPrefUtil>().sharedPreferences!.clear();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
            } 
          ),
        ],
      ),
    );
  }
}

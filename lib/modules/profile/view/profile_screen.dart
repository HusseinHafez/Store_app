import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/component/app_drawer.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_constants.dart';
import 'package:store_app/core/utils/app_images.dart';
import 'package:store_app/core/utils/injection.dart';
import 'package:store_app/modules/profile/controller/profile_cubit.dart';
import 'package:store_app/modules/profile/view/widgets/drawer_row.dart';
import 'package:store_app/modules/profile/view/widgets/profile_container_clipper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProfileCubit>()..getProfileData(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final controller = ProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              centerTitle: AppConstants.appbarCenterTitle,
              elevation: 0,
              title: Text(
                'Profile',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 18.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            drawer: const AppDrawer(),
            body: controller.getProfileDataIsLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          ClipPath(
                            clipper: ProfileContainerClipper(),
                            child: Container(
                              color: AppColors.primaryColor,
                              width: double.infinity,
                              height: 300.h,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 40,
                            child: Container(
                              width: 150.w,
                              height: 150.h,
                              decoration: const BoxDecoration(
                                  color: AppColors.orangeColor,
                                  shape: BoxShape.circle),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [Image.asset(AppImages.profile)],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      DrawerRow(
                          text: '${controller.userModel.username}',
                          icon: Icons.person),
                      SizedBox(
                        height: 10.h,
                      ),
                      DrawerRow(
                          text: '${controller.userModel.email}',
                          icon: Icons.email),
                      SizedBox(
                        height: 10.h,
                      ),
                      DrawerRow(
                          text: '${controller.userModel.phone}',
                          icon: Icons.phone),
                      SizedBox(
                        height: 10.h,
                      ),
                      DrawerRow(
                          text: '${controller.userModel.address!.city}',
                          icon: Icons.location_city),
                      SizedBox(
                        height: 10.h,
                      ),
                      DrawerRow(
                          text:
                              '${controller.userModel.address!.number}/${controller.userModel.address!.street}/${controller.userModel.address!.city}',
                          icon: Icons.location_on)
                    ],
                  ),
          );
        },
      ),
    );
  }
}

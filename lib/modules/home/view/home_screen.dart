import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/component/app_drawer.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/app_constants.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/injection.dart';
import '/modules/home/controller/home_cubit.dart';
import '/modules/home/view/widgets/all_tab.dart';
import '/modules/home/view/widgets/electronics_tab.dart';
import '/modules/home/view/widgets/jewelery_tab.dart';
import '/modules/home/view/widgets/men_clothing_tab.dart';
import '/modules/home/view/widgets/women_clothing_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeCubit>()
        ..getAllCategories()
        ..getAllProducts()
        ..getJeweleryProducts()
        ..getElectronicsProducts()
        ..getMenClothesProducts()
        ..getWomenClothesProducts(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final controller = HomeCubit.get(context);
          return DefaultTabController(
            length: controller.allCategories.length + 1,
            child: Scaffold(
              drawer: const AppDrawer(),
              appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
                title: Text(
                  AppStrings.appTitle,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 25.sp,
                  ),
                ),
                centerTitle: AppConstants.appbarCenterTitle,
                bottom: TabBar(
                    isScrollable: true,
                    dividerColor: AppColors.whiteColor,
                    indicatorColor: AppColors.orangeColor,
                    labelColor: AppColors.orangeColor,
                    unselectedLabelColor: AppColors.whiteColor,
                    tabs: [
                      const Tab(
                        text: 'All',
                      ),
                      ...controller.allCategories
                          .map((e) => Tab(
                                text: e,
                              ))
                          .toList(),
                    ]),
              ),
              body: controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor),
                    )
                  : TabBarView(children: [
                      AllTab(
                        products: controller.allProducts,
                      ),
                      ElectronicsTab(products: controller.electronicsProducts),
                      JeweleryTab(products: controller.jeweleryProducts),
                      MenClothingTab(products: controller.menClothesProducts),
                      WomenClothingTab(
                          products: controller.womenClothesProducts),
                    ]),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_constants.dart';
import 'package:store_app/core/utils/app_strings.dart';
import 'package:store_app/core/utils/injection.dart';
import 'package:store_app/modules/Login/controller/login_cubit.dart';
import 'package:store_app/modules/splash/view/splash_screen.dart';

class StoreApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<LoginCubit>(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: AppConstants.designSize,
            minTextAdapt: AppConstants.minTextAdapt,
            splitScreenMode: AppConstants.splitScreenMode,
            builder: (context, child) =>  const MaterialApp(
              title: AppStrings.appTitle,
              debugShowCheckedModeBanner: AppConstants.visibleDebugBanner,
              home: SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}

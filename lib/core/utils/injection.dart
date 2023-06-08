import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/core/api/dio_consumer.dart';
import 'package:store_app/core/api/dio_interceptors.dart';
import 'package:store_app/core/functions/app_geo_locator.dart';
import 'package:store_app/core/repositories/home_repo/home_repo_imple.dart';
import 'package:store_app/core/repositories/login_repo/login_repo_imple.dart';
import 'package:store_app/core/repositories/product_details_repo/product_details_repo_imple.dart';
import 'package:store_app/core/repositories/profile_repo/profile_repo_imple.dart';
import 'package:store_app/core/repositories/register_repo/register_repo_imple.dart';
import 'package:store_app/core/utils/shared_pref.dart';
import 'package:store_app/modules/Login/controller/login_cubit.dart';
import 'package:store_app/modules/Register/controller/register_cubit.dart';
import 'package:store_app/modules/cart/controller/cart_cubit.dart';
import 'package:store_app/modules/home/controller/home_cubit.dart';
import 'package:store_app/modules/product_details/controller/product_details_cubit.dart';
import 'package:store_app/modules/profile/controller/profile_cubit.dart';

import '../repositories/cart_repo/cart_repo_imple.dart';

GetIt getIt = GetIt.instance;
Future<void> getItInit() async {
  getIt.registerLazySingleton<SharedPrefUtil>(
      ()  => SharedPrefUtil());
  getIt.registerLazySingleton<GeoLocator>(() => GeoLocator());
  getIt.registerLazySingleton<DioConsumer>(
    ()  => DioConsumer(
      client: Dio(),
    ),
  );
  getIt.registerLazySingleton<ProfileRepoImple>(
    () => ProfileRepoImple(dio: getIt()),
  );
  getIt.registerLazySingleton<LoginRepoImple>(
    () => LoginRepoImple(dio: getIt()),
  );
  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(loginRepoImple: getIt(), sharedPrefUtil: getIt()),
  );
  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(profileRepoImple: getIt()),
  );

  getIt.registerLazySingleton<DioInterceptor>(
    () => DioInterceptor(),
  );
  getIt.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));
  getIt.registerLazySingleton<HomeRepoImple>(
    () => HomeRepoImple(
      dio: getIt(),
    ),
  );
  getIt.registerLazySingleton<CartRepoImple>(
    () => CartRepoImple(
      dio: getIt(),
    ),
  );

  getIt.registerLazySingleton<RegisterRepoImple>(
      () => RegisterRepoImple(dio: getIt()));
  getIt.registerLazySingleton<HomeCubit>(
      () => HomeCubit(homeRepoImple: getIt()));
  getIt.registerLazySingleton<RegisterCubit>(
    () => RegisterCubit(
      registerRepoImple: getIt(),
      myGeoLocator: getIt(),
    ),
  );

  getIt.registerLazySingleton<CartCubit>(
    () => CartCubit(cartRepoImple: getIt()),
  );

  getIt.registerLazySingleton<ProductDetailsRepoImple>(
    () => ProductDetailsRepoImple(
      dio: getIt(),
    ),
  );

  getIt.registerLazySingleton<ProductDetailsCubit>(
    () => ProductDetailsCubit(
      productDetailsRepoImple: getIt(),
    ),
  );
}

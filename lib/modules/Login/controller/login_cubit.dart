import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/repositories/login_repo/login_repo_imple.dart';
import 'package:store_app/core/utils/app_strings.dart';
import 'package:store_app/core/utils/shared_pref.dart';
import 'package:store_app/modules/Login/view/login.dart';
import 'package:store_app/modules/home/view/home_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepoImple, required this.sharedPrefUtil})
      : super(LoginInitial());
  final LoginRepoImple loginRepoImple;
  final SharedPrefUtil sharedPrefUtil;
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  bool scurePassword = false;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void passwordVisability() {
    emit(LoginInitial());
    scurePassword = !scurePassword;
    emit(PasswordVisabilityState());
  }

  startPage() {
    if (sharedPrefUtil.getString(key: AppStrings.loginTokenKey) == null) {
      emit(const LoginScreenState(widget: LoginScreen()));
      return const LoginScreen();
    } else {
      emit(const HomeScreenState(widget: HomeScreen()));
      return const HomeScreen();
    }
  }

  bool loginIsLoading = false;
  Map<String, dynamic>? loginResult;
  login(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      loginIsLoading = true;
      emit(LoginIsLoadingState());
      final response = await loginRepoImple.postData(data: {
        'username': userNameController.text.trim(),
        'password': passwordController.text.trim(),
      });
      response.fold(
        (l) {
          loginIsLoading = false;
          debugPrint(l.toString());
          emit(LoginErrorState());
        },
        (r) async {
          loginIsLoading = false;
          loginResult = r;
          await sharedPrefUtil.setString(
              key: AppStrings.loginTokenKey, value: loginResult!['token']);
          // ignore: use_build_context_synchronously
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false,
          );
          emit(LoginSucessState());
        },
      );
    }
  }
}


/* 
"username": "johnd",
"password": "m38rmF$", */
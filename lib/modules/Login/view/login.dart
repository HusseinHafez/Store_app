import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/component/app_textfield.dart';
import 'package:store_app/core/component/auth_button.dart';
import 'package:store_app/core/functions/validate.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_constants.dart';
import 'package:store_app/core/utils/app_images.dart';
import 'package:store_app/modules/Login/controller/login_cubit.dart';
import 'package:store_app/modules/Register/view/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginCubit.get(context); 
        
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.primaryColor,
            body: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logo,
                        width: 150.w,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Login to continue with us',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        AppTextField(
                          hint: 'Username',
                          controller: controller.userNameController,
                          validator: (name) => Validate.notEmpty(name!),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AppTextField(
                          hint: 'Password',
                          isPassWord: AppConstants.isPassWord,
                          scurePassword: controller.scurePassword,
                          onPressedSuffix: controller.passwordVisability,
                          controller: controller.passwordController,
                          validator: (pass) =>
                              Validate.notEmpty(pass!),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AuthButton(
                    text: 'Login',
                    onPressed: () => controller.login(context),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen(),
                                ),
                                (route) => false),
                          text: 'Don\'t have an account?',
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                          children: const [
                            TextSpan(
                                text: '\t SignUp',
                                style: TextStyle(
                                  color: AppColors.redColor,
                                  fontWeight: FontWeight.w500,
                                ))
                          ]))
                ],
              ),
            ),
          ),
        
      
    );
  }
}

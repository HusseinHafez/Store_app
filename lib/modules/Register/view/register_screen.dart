import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/injection.dart';
import 'package:store_app/modules/Login/view/login.dart';
import 'package:store_app/modules/Register/controller/register_cubit.dart';
import '../../../core/component/app_textfield.dart';
import '../../../core/component/auth_button.dart';
import '../../../core/functions/validate.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_images.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (_) => getIt<RegisterCubit>()..getCurrentPosition(),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final controller = RegisterCubit.get(context);
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: AppColors.primaryColor,
              body: Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 20.h,
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
                        height: 10.h,
                      ),
                      Text(
                        'Register',
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
                        'Register to continue with us',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            AppTextField(
                              hint: 'First name',
                              controller: controller.firstNameController,
                              validator: (fname) =>
                                  Validate.validateName(fname!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppTextField(
                              hint: 'Last name',
                              controller: controller.lastNameController,
                              validator: (lname) =>
                                  Validate.validateName(lname!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),AppTextField(
                              hint: 'Full name',
                              controller: controller.fullNameController,
                              validator: (fullname) =>
                                  Validate.validateName(fullname!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            AppTextField(
                              hint: 'Email',
                              controller: controller.emailController,
                              validator: (email) =>
                                  Validate.validateEmail(email!),
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
                                  Validate.validatePassword(pass!),
                            ),  SizedBox(
                              height: 10.h,
                            ),
                            AppTextField(
                              hint: 'phone',
                              controller: controller.phoneController,
                              validator: (code) =>
                                  Validate.notEmpty(code!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                             AppTextField(
                              hint: 'City',
                              controller: controller.cityController,
                              validator: (city) =>
                                  Validate.notEmpty(city!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                              AppTextField(
                              hint: 'Street',
                              controller: controller.streetController,
                              validator: (street) =>
                                  Validate.notEmpty(street!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                              AppTextField(
                              hint: 'House number',
                              controller: controller.houseNumberController,
                              validator: (number) =>
                                  Validate.notEmpty(number!),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                              AppTextField(
                              hint: 'Zipcode',
                              controller: controller.zipcodeController,
                              validator: (code) =>
                                  Validate.notEmpty(code!),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      AuthButton(
                        text: 'Register',
                        onPressed: ()=>controller.register(context),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                     
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (route) => false),
                          text: 'Don\'t have an account?',
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                          children: const [
                            TextSpan(
                                text: '\t SignIn',
                                style: TextStyle(
                                  color: AppColors.redColor,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

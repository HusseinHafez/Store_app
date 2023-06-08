import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_images.dart';
import 'package:store_app/modules/Login/controller/login_cubit.dart';

import '../../../core/utils/app_strings.dart';
import '../../Login/view/login.dart';
import '../../home/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
   AnimationController? _animationController;
   Animation<Offset>? _animation;

   @override
  void initState() {
    super.initState();
    _animationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 600));
    _animation=Tween<Offset>(begin: const Offset(0, 50),end: const Offset(0, 0)).animate(CurvedAnimation(parent: _animationController!, curve: Curves.bounceInOut));
    _animationController?.forward();
    _animationController?.addStatusListener((status) { 
      if(status == AnimationStatus.completed){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginCubit.get(context).sharedPrefUtil.getString(key: AppStrings.loginTokenKey)==null? const LoginScreen():const HomeScreen() ,), (route) => false);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SlideTransition(
        position: _animation!,
        child: Center(
          child: 
          Image.asset(AppImages.logo,scale: 6,),
        ),
      ),
    );
  }
}
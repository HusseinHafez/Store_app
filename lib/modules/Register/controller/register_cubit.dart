import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/functions/app_geo_locator.dart';
import 'package:store_app/core/repositories/register_repo/register_repo_imple.dart';
import 'package:store_app/modules/Login/view/login.dart';
import 'package:store_app/modules/Register/model/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.myGeoLocator, required this.registerRepoImple})
      : super(RegisterInitial());
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final GeoLocator myGeoLocator;
  final RegisterRepoImple registerRepoImple;
  bool scurePassword = true;
  bool isLoading = false;
  void passwordVisability() {
    emit(RegisterInitial());
    scurePassword = !scurePassword;
    emit(PasswordVisabilityState());
  }

  Future<void> getCurrentPosition() async {
    await myGeoLocator.getPosition().then((value) {
      debugPrint("lat : ${value.latitude}");
      debugPrint("long : ${value.longitude}");
    });
  }

  dynamic result;
  bool registerLoading = false;
  register(BuildContext context) async {
    getCurrentPosition();
    emit(GetCurrentPosition());

    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      registerLoading = true;
      emit(RegisterLoadingState());
      final response = await registerRepoImple.postData(
          data: UserModel(
        address: Address(
          city: cityController.text.trim(),
          street: streetController.text.trim(),
          number: int.parse(houseNumberController.text.trim()),
          zipcode: zipcodeController.text.trim(),
          geolocation: Geolocation(
            lat: myGeoLocator.lat.toString(),
            long: myGeoLocator.long.toString(),
          ),
        ),
        email: emailController.text.trim(),
        name: Name(
            firstname: firstNameController.text.trim(),
            lastname: lastNameController.text.trim()),
        password: passwordController.text.trim(),
        phone: phoneController.text.trim(),
        username: fullNameController.text.trim(),
      ).toJson());
      response.fold(
        (l) {
          registerLoading = false;
          debugPrint(l.toString());
          emit(RegisterErrorState());
        },
        (r) {
          registerLoading = false;
          result = r;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
          emit(RegisterSucessState());
        },
      );
    }
  }
}

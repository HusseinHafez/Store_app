import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/repositories/profile_repo/profile_repo_imple.dart';
import 'package:store_app/modules/Register/model/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepoImple}) : super(ProfileInitial());
  final ProfileRepoImple profileRepoImple;
  static ProfileCubit get(BuildContext context)=>BlocProvider.of(context);
   bool getProfileDataIsLoading=false;
   UserModel userModel=UserModel();
  getProfileData()async{
    getProfileDataIsLoading=true;
    emit(ProfileIsLoadingState());
    final response=await profileRepoImple.getData();
    response.fold((l){
    getProfileDataIsLoading=false;
    debugPrint(l.toString());
    emit(ProfileErrorState());
    }, (r) {
      getProfileDataIsLoading=false;
      userModel=r;
      emit(ProfileSucessState());
    });
  }
}

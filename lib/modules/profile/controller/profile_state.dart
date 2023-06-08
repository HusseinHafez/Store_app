part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}
class ProfileIsLoadingState extends ProfileState {}
class ProfileSucessState extends ProfileState {}
class ProfileErrorState extends ProfileState {}

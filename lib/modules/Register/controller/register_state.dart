part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}
class PasswordVisabilityState extends RegisterState {}
class RegisterSucessState extends RegisterState {}
class RegisterErrorState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class GetCurrentPosition extends RegisterState {}

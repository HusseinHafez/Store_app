part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginIsLoadingState extends LoginState {}
class LoginSucessState extends LoginState {}
class LoginErrorState extends LoginState {}
class PasswordVisabilityState extends LoginState {}



class LoginScreenState extends LoginState {
  final Widget? widget;

   const LoginScreenState({required this.widget}):super();
   @override
  List<Object> get props => [widget!];

}
class HomeScreenState extends LoginState {
  final Widget? widget;

   const HomeScreenState({required this.widget}):super();
   @override
  List<Object> get props => [widget!];
}

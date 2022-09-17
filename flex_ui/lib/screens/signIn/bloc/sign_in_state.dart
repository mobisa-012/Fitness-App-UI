part of 'sign_in_bloc.dart';
@immutable
abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {}


// ignore: must_be_immutable
class SignInButtonEnabledChangedState extends SignInState {
  bool isEnabled;
  SignInButtonEnabledChangedState({required this.isEnabled});
}

class LoadingState extends SignInState {}

class NextTabBarPageState extends SignInState {}

class SignInErrorState extends SignInState {
  final String message;
  const SignInErrorState ({required this.message});
}

class NextForgotPasswordPageState extends SignInState {}

class NextSignUpState extends SignInState {}

class ShowErrorState extends SignInState {}

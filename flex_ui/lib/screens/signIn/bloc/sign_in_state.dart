part of'sign_in_bloc.dart';

abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {}

class SignInButtonEnabledChangedState extends SignInState {
  bool isEnabled;
  SignInButtonEnabledChangedState({required this.isEnabled});
}

class LoadingState extends SignInState {}

class NextTabBarState extends SignInState {}

class ErrorState extends SignInState {
  final String message;
  ErrorState ({required this.message});
}

class NextForgotPasswordPageState extends SignInState {}

class NextSignUpState extends SignInState {}

class ShowErrorState extends SignInState {}

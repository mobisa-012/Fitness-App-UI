part of 'sign_in_bloc.dart';
@immutable
abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {}

class SignInButtonEnableChangedState extends SignInState {
  final bool isEnabled;

  const SignInButtonEnableChangedState({
    required this.isEnabled,
  });
}

class ShowErrorState extends SignInState {}

class NextForgotPasswordPageState extends SignInState {}

class NextSignUpPageState extends SignInState {}

class NextTabBarPageState extends SignInState {}

class ErrorState extends SignInState {
  final String message;

  const ErrorState({
    required this.message,
  });
}

class LoadingState extends SignInState {}
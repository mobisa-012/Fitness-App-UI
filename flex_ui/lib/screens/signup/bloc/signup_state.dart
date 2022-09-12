part of'signup_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpButtonEnabledState extends SignUpState {
  final bool isEnabled;

  SignUpButtonEnabledState({required this.isEnabled});
}

class LoadingState extends SignUpState {}

class NextTabBarPageState extends SignUpState {}

class ErrorState extends SignUpState {
  final String message;

  ErrorState({
    required this.message
  });
}

class ShowErrorState extends SignUpState {}

class NextSignInPageState extends SignUpState {}

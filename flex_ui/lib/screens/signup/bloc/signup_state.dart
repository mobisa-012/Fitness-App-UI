part of 'signup_bloc.dart';
@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpButtonEnabledState extends SignUpState {
  final bool isEnabled;

  SignUpButtonEnabledState({
    required this.isEnabled,
  });
}

class ShowErrorState extends SignUpState {}

class ErrorState extends SignUpState {
  final String message;

  ErrorState({required this.message});
}

class NextTabBarPageState extends SignUpState {}

class NextSignInPageState extends SignUpState {}

class LoadingState extends SignUpState {}

part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordError extends ForgotPasswordState {
  final String message;

  ForgotPasswordError ({required this.message});
}

class ForgotPasswordSuccess extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

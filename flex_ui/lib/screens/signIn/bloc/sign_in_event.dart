part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class OnTextChangedEvent extends SignInEvent {}

class SignInTappedEvent extends SignInEvent {}

class ForgotPasswordTappedEvent extends SignInEvent {}

class SignUpTappedEvent extends SignInEvent {}
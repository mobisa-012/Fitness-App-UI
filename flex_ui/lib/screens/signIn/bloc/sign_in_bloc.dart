// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flex_ui/core/services/auth_service.dart';
import 'package:flex_ui/core/services/validation_service.dart';
import 'package:flutter/cupertino.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<OnTextChangeEvent>((event, emit) async {
      emit(const SignInButtonEnableChangedState(isEnabled: true));
    });
    on<SignInTappedEvent>((event, emit) async {
      emit(LoadingState());
    });
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isButtonEnabled = false;

  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is OnTextChangeEvent) {
      if (isButtonEnabled != _checkIfSignInButtonEnabled()) {
        isButtonEnabled = _checkIfSignInButtonEnabled();
        yield SignInButtonEnableChangedState(isEnabled: isButtonEnabled);
      }
    } else if (event is SignInTappedEvent) {
      if (_checkValidatorsOfTextField()) {
        try {
          yield LoadingState();
          await AuthService.signIn(
              emailController.text, passwordController.text);
          yield NextTabBarPageState();
          print("Go to the next page");
        } catch (e) {
          print('E to tstrng: $e');
          yield ErrorState(message: e.toString());
        }
      } else {
        yield ShowErrorState();
      }
    } else if (event is ForgotPasswordTappedEvent) {
      yield NextForgotPasswordPageState();
    } else if (event is SignUpTappedEvent) {
      yield NextSignUpPageState();
    }
  }

  bool _checkIfSignInButtonEnabled() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  bool _checkValidatorsOfTextField() {
    return ValidationService.email(emailController.text) &&
        ValidationService.password(passwordController.text);
  }
}

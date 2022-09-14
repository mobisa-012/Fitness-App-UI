import 'package:bloc/bloc.dart';
import 'package:flex_ui/core/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

part 'forgot_password_event.dart';
part  'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial());

  final emailController = TextEditingController();
  bool isError = false;


  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ForgotPasswordTappedEvent) {
      try {
        yield ForgotPasswordLoading();
        await AuthService.resetPassword(emailController.text);
        yield ForgotPasswordSuccess();
      } catch (e) {
        print('Error: ' + e.toString());
        yield ForgotPasswordError(message: e.toString());
      }
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/core/services/user_service.dart';
import 'package:flutter/cupertino.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial());

  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    if (event is ChangePassword) {
      yield ChangePasswordProgress();
      try {
        await UserService.changePassword(newPassword: event.newPassword);
        yield ChangePasswordSuccess(message: TextConstants.passwordUpdated);
        await Future.delayed(const Duration(seconds: 1));
        yield ChangePasswordInitial();
      } catch (e) {
        yield ChangePasswordError(error: e.toString());
        await Future.delayed(const Duration(seconds: 1));
        yield ChangePasswordInitial();
      }
    }
  }
}

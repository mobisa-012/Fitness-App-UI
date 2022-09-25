import 'package:flex_ui/core/services/firebase_storage_service.dart';
import 'package:flex_ui/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_account_screen_event.dart';
part 'edit_account_screen_state.dart';

class EditAccountBloc extends Bloc<EditAccountEvent, EditAccountState> {
  EditAccountBloc() : super(EditAccountInitial());


  Stream<EditAccountState> mapEventToState(
    EditAccountEvent event,
  ) async* {
    if (event is UploadImage) {
      try {
        final XFile? image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          yield EditAccountProgress();
          await FirebaseStorageService.uploadImage(filePath: image.path);
          yield EditPhotoSuccess(image);
        }
      } catch (e) {
        yield EditAccountError(error: e.toString());
        await Future.delayed(const Duration(seconds: 1));
        yield EditAccountInitial();
      }
    }
    if (event is ChangeUserData) {
      yield EditAccountProgress();
      try {
        await UserService.changeUserData(
            displayName: event.displayName, email: event.email);
        yield EditAccountInitial();
      } catch (e) {
        yield EditAccountError(error: e.toString());
        await Future.delayed(const Duration(seconds: 1));
        yield EditAccountInitial();
      }
    }
  }
}

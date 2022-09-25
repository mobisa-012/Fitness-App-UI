import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditAccountBloc extends Bloc<EditAccountEvent, EditAccountState> {
  EditAccountBloc() : super(EditAccountInitial());

  @override
  Stream<EditAccountState> mapEventToState (
    EditAccountEvent event,
  ) async* {
    if (event is UploadImage) {
      try {
        final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(image != null) {
          yield EditAccountProgress();
          await FirebaseStorageService.uplo
        }
      }
    }
  }
}

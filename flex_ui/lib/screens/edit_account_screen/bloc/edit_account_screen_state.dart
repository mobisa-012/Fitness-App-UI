part of 'edit_account_screen_bloc.dart';

@immutable
abstract class EditAccountState {}

class EditAccountInitial extends EditAccountState {}

class EditAccountProgress extends EditAccountState {}

class EditAccountError extends EditAccountState {
  final String error;

  EditAccountError({required this.error});
}

class EditPhotoSuccess extends EditAccountState {
  final XFile image;

  EditPhotoSuccess(this.image);
}

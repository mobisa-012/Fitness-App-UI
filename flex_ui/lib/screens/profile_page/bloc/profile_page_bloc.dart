import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());

  Stream<ProfileState> mapEventToState (
    ProfileEvent event
  ) async* {}
}

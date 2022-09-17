import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is ReloadImageEvent) {
      yield ReloadImageState();
    }
  }
}

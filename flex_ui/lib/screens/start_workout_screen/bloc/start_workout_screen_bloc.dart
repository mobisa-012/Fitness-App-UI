import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'start_workout_screen_event.dart';
part 'start_workout_screen_state.dart';

class StartWorkoutBloc extends Bloc<StartWorkoutEvent, StartWorkoutState> {
  StartWorkoutBloc() : super(StartWorkoutInitial()) {
    on<BackTappedEvent>((event, emit) async {
      emit(BackTappedState());
    });
  }

  int time = 0;
  Stream<StartWorkoutState> mapEventToState(StartWorkoutEvent event) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is PlayTappedEvent) {
      time = event.time;
      yield PlayTimerState(time: event.time);
    } else if (event is PausedTappedEvent) {
      time = event.time;
      yield PauseTimerState(currentTime: time);
    }
  }
}

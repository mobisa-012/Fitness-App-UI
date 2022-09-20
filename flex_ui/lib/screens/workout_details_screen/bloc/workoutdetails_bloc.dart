import 'package:flex_ui/data/exercise_data.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'workoutdetails_event.dart';
part 'workoutdetails_state.dart';


class WorkoutDetailsBloc extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  final WorkoutData workout;
  WorkoutDetailsBloc({required this.workout}) : super(WorkoutDetailsInitial());

  Stream<WorkoutDetailsState> mapEventToState(
    WorkoutDetailsEvent event,
  ) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is WorkoutExerciseCellTappedEvent) {
      yield WorkoutExerciseCellTappedState(
        currentExercise: event.currentExercise,
        nextExercise: event.nextExercise,
      );
    }
  }
}

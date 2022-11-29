import 'package:flex_ui/core/const/data_constants.dart';
import 'package:flex_ui/data/exercise_data.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'analytics_page_event.dart';
part 'analytics_page_state.dart';

class AnalyticsPageBloc extends Bloc<AnalyticsPageEvent, AnalyticsPageState> {
  AnalyticsPageBloc() : super(AnalyticsPageInitial());

  List<WorkoutData> workouts = <WorkoutData>[];
  List<ExerciseData> exercises = <ExerciseData>[];
  int timeSpent = 0;

  Stream<AnalyticsPageState> mapEventToState(AnalyticsPageEvent event) async* {
    if (event is ReloadImageEvent) {
      yield ReloadImageState();
    }
  }

  int getProgressPercent() {
    final completed = workouts
        .where(
            (w) => (w.currentProgress) > 0 && w.currentProgress == w.progress)
        .toList();
    final percent01 =
        completed.length.toDouble() / DataConstants.workouts.length.toDouble();
    final percent = (percent01 * 100).toInt();
    return percent;
  }

  int? getFinishedWorkouts() {
    final completedWorkouts =
        workouts.where((w) => w.currentProgress == w.progress).toList();
    return completedWorkouts.length;
  }

  int? getInProgessWorkouts() {
    final completedWorkouts = workouts.where(
        (w) => (w.currentProgress) > 0 && w.currentProgress != w.progress);
    return completedWorkouts.length;
  }

  int? getTimeSpent() {
    for (final WorkoutData workout in workouts) {
      exercises.addAll(workout.exerciseDataList);
    }
    final exercise = exercises.where((e) => e.progress == 1).toList();
    for (var e in exercise) {
      timeSpent += e.seconds;
    }
    return timeSpent;
  }
}

import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/core/extensions/list_extensions.dart';
import 'package:flex_ui/data/exercise_data.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flex_ui/screens/common_widgets/fitness_button.dart';
import 'package:flex_ui/screens/workout_details_screen/bloc/workoutdetails_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final WorkoutData workout;

  const WorkoutDetailsPage({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContext(context);
  }

  BlocProvider<WorkoutDetailsBloc> _buildContext(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutDetailsBloc(workout: workout),
      child: BlocConsumer<WorkoutDetailsBloc, WorkoutDetailsState>(
        buildWhen: (_, currState) => currState is WorkoutDetailsInitial,
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FitnessButton(
                title: TextConstants.start,
                onTap: () {
                  ExerciseData? exercise = workout.exerciseDataList
                      .firstWhereOrNull((element) => element.progress < 1);
                  // ignore: prefer_conditional_assignment
                  if (exercise == null)
                    // ignore: curly_braces_in_flow_control_structures
                    exercise = workout.exerciseDataList.first;
                  int exerciseIndex =
                      workout.exerciseDataList.indexOf(exercise);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<WorkoutDetailsBloc>(context),
                            child: StartWorkoutPage(
                              exercise: exercise!,
                              currentExercise: exercise,
                              nextExerciese: exerciseIndex + 1 <
                                      workout.exerciseDataList.length
                                  ? workout.exerciseDataList[exerciseIndex + 1]
                                  : null,
                            ),
                          )));
                },
              ),
            ),
            body: WorkoutDetailsContent(workout: workout),
          );
        },
        listenWhen: (_, currState) =>
            currState is BackTappedState ||
            currState is WorkoutExerciseCellTappedState,
        listener: (context, state) {
          if (state is BackTappedState) {
            Navigator.pop(context);
          } else if (state is WorkoutExerciseCellTappedState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<WorkoutDetailsBloc>(context),
                      child: StartWorkoutPage(
                        exercise: state.currentExercise,
                        currentExercise: state.currentExercise,
                        nextExercise: state.nextExercise
                      ),
                    )));
          }
        },
      ),
    );
  }
}

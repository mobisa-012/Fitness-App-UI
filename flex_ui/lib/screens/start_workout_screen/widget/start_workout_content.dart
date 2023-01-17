import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/data/exercise_data.dart';
import 'package:flex_ui/screens/common_widgets/fitness_button.dart';
import 'package:flex_ui/screens/start_workout_screen/bloc/start_workout_screen_bloc.dart';
import 'package:flex_ui/screens/start_workout_screen/widget/start_workout_video.dart';
import 'package:flex_ui/screens/workout_details_screen/bloc/workoutdetails_bloc.dart'
    as workout_bloc;
import 'package:flex_ui/screens/start_workout_screen/page/start_workout_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartWorkoutContent extends StatelessWidget {
  final ExerciseData exercise;
  final ExerciseData? nextExercise;

  const StartWorkoutContent(
      {Key? key, required this.exercise, this.nextExercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.homeBackground,
      child: SafeArea(
        child: _createDetailedExercise(context),
      ),
    );
  }

  Widget _createDetailedExercise(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      child: SizedBox(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createBackButton(context),
            const SizedBox(
              height: 20,
            ),
            _createimage(context),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    _createTitle(),
                    const SizedBox(
                      height: 9,
                    ),
                    _createDescription(),
                    const SizedBox(
                      height: 30,
                    ),
                    _createSteps(),
                  ],
                ),
              ],
            ),
            _createTimeTracker(context),
          ],
        ),
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    final bloc = BlocProvider.of<StartWorkoutBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: GestureDetector(
        child: BlocBuilder<StartWorkoutBloc, StartWorkoutState>(
          builder: (context, state) {
            return Row(
              children: const [
                Image(image: AssetImage(PathConstatnts.arrow)),
                SizedBox(
                  width: 17,
                ),
                Text(
                  TextConstants.back,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            );
          },
        ),
        onTap: () {
          bloc.add(BackTappedEvent());
        },
      ),
    );
  }

  Widget _createimage(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.homeBackground,
      ),
      child:  StartWorkoutImage(exercise: exercise),
    );
  }

  Widget _createTitle() {
    return Text(
      exercise.title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _createDescription() {
    return Text(
      exercise.description,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _createSteps() {
    return Column(children: [
      for (int i = 0; i < exercise.steps.length; i++) ...[
        Step(number: '${i + 1}', description: exercise.steps[i]),
        const SizedBox(
          height: 20,
        ),
      ]
    ]);
  }

  Widget _createTimeTracker(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.homeBackground,
      child: Column(children: [
        nextExercise != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    TextConstants.nextExercise,
                    style: TextStyle(
                        color: AppColors.categoriesWorkoutsTextColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 6.5,
                  ),
                  const Icon(
                    Icons.access_time_filled,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 6.5,
                  ),
                  Text(
                      '${nextExercise!.seconds >= 10 ? nextExercise!.seconds : '0${nextExercise!.seconds}'}')
                ],
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 18,
        ),
        _createButton(context),
      ]),
    );
  }

  Widget _createButton(BuildContext context) {
    return FitnessButton(
      title: nextExercise != null ? TextConstants.next : 'Finish',
      onTap: () {
        if (nextExercise != null) {
          List<ExerciseData> exercisesList =
              BlocProvider.of<workout_bloc.WorkoutDetailsBloc>(context)
                  .workout
                  .exerciseDataList;
          int currentExerciseIndex = exercisesList.indexOf(exercise);
          if (currentExerciseIndex < exercisesList.length - 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<workout_bloc.WorkoutDetailsBloc>(
                            context),
                        child: StartWorkoutPage(
                          exercise: exercisesList[currentExerciseIndex + 1],
                          currentExercise:
                              exercisesList[currentExerciseIndex + 1],
                          nextExercise:
                              currentExerciseIndex + 2 < exercisesList.length
                                  ? exercisesList[currentExerciseIndex + 2]
                                  : null,
                        ),
                      )),
            );
          }
        } else {
          Navigator.of(context).pop();
        }
      },
    );
  }
}

class Step extends StatelessWidget {
  final String number;
  final String description;

  const Step({Key? key, required this.number, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.weightLossContainerColor.withOpacity(0.12),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          description,
        ))
      ],
    );
  }
}

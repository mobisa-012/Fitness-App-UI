import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/data/exercise_data.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flex_ui/screens/workout_details_screen/bloc/workoutdetails_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExercisesList extends StatelessWidget {
  final WorkoutData workout;
  final List<ExerciseData> exercises;

  // ignore: use_key_in_widget_constructors
  const ExercisesList({required this.exercises, required this.workout});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        return ExerciseCell(
          currentExercise: exercises[index],
          nextExercise:
              index == exercises.length - 1 ? null : exercises[index + 1],
          workout: workout,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15);
      },
    );
  }
}

class ExerciseCell extends StatelessWidget {
  final WorkoutData workout;
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  const ExerciseCell({super.key, 
    required this.currentExercise,
    required this.workout,
    required this.nextExercise,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<WorkoutDetailsBloc>(context);
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      buildWhen: (_, currState) => currState is WorkoutExerciseCellTappedState,
      builder: (context, state) {
        return InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            bloc.add(
              WorkoutExerciseCellTappedEvent(
                currentExercise: currentExercise,
                nextExercise: nextExercise,
              ),
            );
          },
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 10, right: 25, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.homeBackground,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.12),
                  blurRadius: 5.0,
                  spreadRadius: 1.1,
                ),
              ],
            ),
            child: Row(
              children: [
                _createImage(),
                const SizedBox(width: 10),
                Expanded(
                  child: _createExerciseTextInfo(),
                ),
                const SizedBox(width: 10),
                _createRightArrow(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _createImage() {
    return Container(
      width: 75,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(currentExercise.pic),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _createExerciseTextInfo() {
    final secondsStr = "${currentExercise.seconds} seconds";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentExercise.title,
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          secondsStr,
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 11),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: LinearPercentIndicator(
            percent: currentExercise.progress,
            progressColor: AppColors.onboardingColor,
            backgroundColor: AppColors.onboardingColor.withOpacity(0.12),
            lineHeight: 6,
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  Widget _createRightArrow() {
    return const RotatedBox(
      quarterTurns: 2,
      child: Image(
        image: AssetImage(PathConstatnts.arrow),
      ),
    );
  }
}

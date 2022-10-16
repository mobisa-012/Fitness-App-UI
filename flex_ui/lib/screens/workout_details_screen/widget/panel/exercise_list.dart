import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/data/exercise_data.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flex_ui/screens/workout_details_screen/bloc/workoutdetails_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ExerciseList extends StatelessWidget {
  final WorkoutData workout;
  final List<ExerciseData> exercise;

  const ExerciseList({Key? key, required this.workout, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      itemCount: exercise.length,
      itemBuilder: (context, index) {
        return ExerciseCell(
            currentExercise: exercise[index],
            nextExercise:
                index == exercise.length - 1 ? null : exercise[index + 1],
            workout: workout);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 14,
        );
      },
    );
  }
}

class ExerciseCell extends StatelessWidget {
  final WorkoutData workout;
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  const ExerciseCell(
      {Key? key,
      required this.workout,
      required this.currentExercise,
      required this.nextExercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<WorkoutDetailsBloc>(context);
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      buildWhen: (_, currState) => currState is WorkoutExerciseCellTappedState,
      builder: (context, state) {
        return InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            bloc.add(WorkoutExerciseCellTappedEvent(
              currentExercise: currentExercise,
              nextExercise: nextExercise,
            ));
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
                      color: AppColors.loadingBlack.withOpacity(0.12),
                      blurRadius: 5.0,
                      spreadRadius: 1.1)
                ]),
            child: Row(
              children: [
                _createImage(),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: _createExerciseListInfo(),
                ),
                const SizedBox(
                  width: 10,
                ),
                _createRightArrow()
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
          image: DecorationImage(
        image: AssetImage(workout.image),
        fit: BoxFit.contain,
      )),
    );
  }

  Widget _createExerciseListInfo() {
    final minuteStr = '${currentExercise.minutes} minutes';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentExercise.title,
          style: const TextStyle(
              color: AppColors.loadingBlack,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        Text(
          minuteStr,
          style: const TextStyle(
            color: AppColors.topWorkoutsandCategoriesColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: LinearPercentIndicator(
            percent: currentExercise.progress,
            progressColor: AppColors.dropDownColor,
            backgroundColor: AppColors.homeBackground.withOpacity(0.12),
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

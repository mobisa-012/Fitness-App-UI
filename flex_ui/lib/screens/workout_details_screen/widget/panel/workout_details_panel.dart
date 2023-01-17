import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flex_ui/screens/workout_details_screen/widget/panel/exercise_list.dart';
import 'package:flex_ui/screens/workout_details_screen/widget/panel/workout_tag.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPanel extends StatelessWidget {
  final WorkoutData workout;

  const WorkoutDetailsPanel({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return _createPanelData();
  }

  Widget _createPanelData() {
    return Column(
      children: [
        const SizedBox(height: 15),
        _createRectangle(),
        const SizedBox(height: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createHeader(),
              const SizedBox(height: 20),
              _createWorkoutData(),
              const SizedBox(height: 20),
              _createExerciesList()
            ],
          ),
        ),
      ],
    );
  }

  Widget _createRectangle() {
    return const Image(image: AssetImage(PathConstatnts.rectangle));
  }

  Widget _createHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "${workout.title}  ${TextConstants.workout}",
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createWorkoutData() {
    return Flex(
      direction: Axis.horizontal,
      children: [Expanded(
        child: Row(
          children: [
            WorkoutTag(
              icon: PathConstatnts.timeTracker,
              content: "${workout.seconds}:00",
            ),
            const SizedBox(width: 10),
            WorkoutTag(
              icon: PathConstatnts.exerciseTracker,
              content:
                  "${workout.exercises} ${TextConstants.exercisesLowercase}",
            ),
          ],
        ),
      ),]
    );
  }

  Widget _createExerciesList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ExercisesList(
            exercises: workout.exerciseDataList, workout: workout),
      ),
    );
  }
}

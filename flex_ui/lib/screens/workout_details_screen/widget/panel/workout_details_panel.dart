import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flex_ui/screens/workout_details_screen/widget/panel/exercise_list.dart';
import 'package:flex_ui/screens/workout_details_screen/widget/panel/workout_tag.dart';
import 'package:flutter/cupertino.dart';

class WorkoutDetailsPanel extends StatelessWidget {
  final WorkoutData workout;

  const WorkoutDetailsPanel({Key? key, required this.workout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createPanelData();
  }

  Widget _createPanelData() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        _createRectangle(),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createHeader(),
              const SizedBox(
                height: 15,
              ),
              _createWorkoutData(),
              const SizedBox(
                height: 18,
              ),
              _createExerciseList(),
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
        '${workout.title} ${TextConstants.workout}',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createWorkoutData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          WorkoutTag(
            icon: PathConstatnts.timeTracker,
            content: '${workout.minutes}:00',
          ),
          const SizedBox(
            width: 15,
          ),
          WorkoutTag(
            icon: PathConstatnts.exercise,
            content: '${workout.exercises} ${TextConstants.exercisesLowercase}',
          ),
        ],
      ),
    );
  }

  Widget _createExerciseList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ExerciseList(
          workout: workout, 
          exercise: workout.exerciseDataList,
          ),
      ),
    );
  }
}

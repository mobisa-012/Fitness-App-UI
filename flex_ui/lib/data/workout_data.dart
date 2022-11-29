import 'package:flex_ui/data/exercise_data.dart';

class WorkoutData {
  final String title;
  final String exercises;
  final String seconds;
  final int currentProgress;
  final int progress;
  final String image;
  final List<ExerciseData> exerciseDataList;

  WorkoutData(
      {required this.currentProgress,
      required this.exercises,
      required this.exerciseDataList,
      required this.image,
      required this.seconds,
      required this.progress,
      required this.title});

  @override
  String toString() {
    return 'WorkoutData(title: $title, exercises: $exercises, seconds: $seconds, currentProgress: $currentProgress, progress: $progress, image: $image, exerciseDataList: $exerciseDataList)';
  }
}

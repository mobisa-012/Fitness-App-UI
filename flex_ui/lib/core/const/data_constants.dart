import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/data/exercise_data.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flex_ui/screens/onboarding/widget/onboarding_tile.dart';

// onboarding screen
class DataConstants {
  static final onboardingTiles = [
    const OnboardingTile(
      title: TextConstants.onboarding1Title,
      imaPath: PathConstatnts.onboarding1,
      mainText: TextConstants.onboarding1Description,
    ),
    const OnboardingTile(
      title: TextConstants.onboarding2Title,
      mainText: TextConstants.onboarding2Description,
      imaPath: PathConstatnts.onboarding2,
    ),
    const OnboardingTile(
      imaPath: PathConstatnts.onboarding3,
      mainText: TextConstants.onboarding3Description,
      title: TextConstants.onboarding3Title,
    )
  ];

  static final List<WorkoutData> homeWorkoutsTopWorkouts = [
    WorkoutData(
      //weight losss container
      currentProgress: 10, 
      exercises: TextConstants.fullBodyWorkout, 
      exerciseDataList: [
        ExerciseData(
          title: ,
          minutes: ,
          progress: ,
          video: ,
          description: ,
          image: ,
        )], 
      image: PathConstatnts.fullbody, 
      minutes: TextConstants.time, 
      progress: 16, 
      title: TextConstants.weightLossTraining,
      )
  ];

  static final List<WorkoutData> categoriesWorkouts = [
    WorkoutData(
      currentProgress: currentProgress, 
      exercises: exercises, 
      exerciseDataList: exerciseDataList, 
      image: image, 
      minutes: minutes, 
      progress: progress, 
      title: title)
  ];
}

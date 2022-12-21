import 'package:flex_ui/data/exercise_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartWorkoutImage extends StatelessWidget {
 final ExerciseData exercise;
  const StartWorkoutImage({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image(
        image: AssetImage(exercise.image),
        fit: BoxFit.cover,
      ),
    );
  }
}

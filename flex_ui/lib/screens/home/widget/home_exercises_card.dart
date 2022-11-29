import 'package:flex_ui/data/workout_data.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final Color color;
  final WorkoutData workout;
  final Function() onTap;

  const WorkoutCard(
      {Key? key,
      required this.color,
      required this.workout,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 12),
        height: 180,
        width: screenWidth * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5,),
                      Text(
                        workout.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        workout.exercises,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ],
                    ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image(
              image: AssetImage(workout.image),
            ),)
          ],
        ),
      ),
    );
  }
}

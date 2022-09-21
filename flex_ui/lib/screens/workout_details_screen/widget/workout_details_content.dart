import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flex_ui/screens/workout_details_screen/widget/panel/workout_details_panel.dart';
import 'package:flex_ui/screens/workout_details_screen/widget/workout_details_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class WorkoutDetailsContent extends StatelessWidget {
  final WorkoutData workout;

  const WorkoutDetailsContent({Key? key, required this.workout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.homeBackground,
      child: _createSlidingPanel(context),
    );
  }

  Widget _createSlidingPanel(BuildContext context) {
    return SlidingUpPanel(
      panel: WorkoutDetailsPanel(workout: workout),
      body: WorkoutDetailsBody(workout: workout),
      minHeight: MediaQuery.of(context).size.height * 0.65,
      maxHeight: MediaQuery.of(context).size.height * 0.87,
      isDraggable: true,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30)
        ),
    );
  }
}

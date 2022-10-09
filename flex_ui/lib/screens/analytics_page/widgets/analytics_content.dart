import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AnalyticsContent extends StatelessWidget {
  const AnalyticsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.homeBackground,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createDate(context),
            const SizedBox(
              height: 25,
            ),
            _createCalories(context),
            const SizedBox(
              height: 20,
            ),
            _createTrainingandSteps(context),
          ],
        ),
      ),
    );
  }

  Widget _createDate(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          TextConstants.today,
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: AppColors.todayandcaloriesDropDownColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          DateFormat.MMMMEEEEd().format(DateTime.now()),
          style: const TextStyle(
              color: AppColors.loadingBlack,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _createCalories(BuildContext context) {
    final int displayCalories;
    return Center(
      child: CircularStepProgressIndicator(
        totalSteps: 1300,
        currentStep: 550,
        stepSize: 100,
        selectedColor: AppColors.topWorkoutsandCategoriesColor,
        unselectedColor: AppColors.categoriesWorkoutsTextColor,
        height: 250,
        width: 250,
        padding: 0,
        selectedStepSize: 100,
        roundedCap: (_, __) => true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              TextConstants.activeCalories,
              style: TextStyle(
                fontSize: 25,
                color: AppColors.categoriesWorkoutsTextColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '$displayCalories',
              style: TextStyle(
                  fontSize: 23,
                  color: AppColors.loadingBlack.withOpacity(0.12),
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
      ),
    );
  }

  Widget _createTrainingandSteps(BuildContext context) {
    final int displayWorkoutTime;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 40, 130, 182),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                TextConstants.workoutTime,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.loadingBlack,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$displayWorkoutTime',
                    style: const TextStyle(
                      fontSize: 25,
                      color: AppColors.homeBackground,
                      fontWeight: FontWeight.w800
                    ),
                  )
                  ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

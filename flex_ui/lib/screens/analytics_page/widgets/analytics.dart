import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/screens/analytics_page/bloc/analytics_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AnalyticsPageBloc>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _completedWorkouts(context, bloc),
          _statisticsColumn(bloc),
        ],
      ),
    );
  }

  Widget _completedWorkouts(BuildContext context, AnalyticsPageBloc bloc) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(15),
      height: 230,
      width: screenWidth * 0.45,
      decoration: BoxDecoration(
        color: AppColors.homeBackground,
        boxShadow: [
          BoxShadow(
              color: AppColors.textColor.withOpacity(0.1),
              blurRadius: 5.0,
              spreadRadius: 1.1),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: const [
              Image(image: AssetImage(PathConstatnts.finished)),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                TextConstants.finished,
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ))
            ],
          ),
          Text(
            '${bloc.getFinishedWorkouts()}',
            style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: AppColors.textColor),
          ),
          const Text(
            'Completed',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const Text(
            'workouts',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _statisticsColumn(AnalyticsPageBloc bloc) {
    return Column(
      children: [
        DataWorkouts(
          icon: PathConstatnts.inProgress,
          title: TextConstants.inProgress,
          count: bloc.getInProgessWorkouts() ?? 0,
          text: TextConstants.workouts,
        ),
        const SizedBox(
          height: 20,
        ),
        DataWorkouts(
          icon: PathConstatnts.time,
          title: TextConstants.time,
          count: bloc.getTimeSpent() ?? 0,
          text: TextConstants.seconds,
        )
      ],
    );
  }
}

class DataWorkouts extends StatelessWidget {
  final String icon;
  final String title;
  final int count;
  final String text;

  const DataWorkouts(
      {super.key,
      required this.icon,
      required this.title,
      required this.count,
      required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 100,
      width: screenWidth * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.homeBackground,
          boxShadow: [
            BoxShadow(
                color: AppColors.textColor.withOpacity(0.1),
                blurRadius: 5.0,
                spreadRadius: 1.1)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Image(image: AssetImage(icon)),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )
            ],
          ),
          Row(
            children: [
              Text(
                count.toString(),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

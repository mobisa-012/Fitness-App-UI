part of 'analytics_page_bloc.dart';

abstract class AnalyticsPageState {}

class AnalyticsPageInitial extends AnalyticsPageState {}

class TodayDateState extends AnalyticsPageState {}

class CountStepsState extends AnalyticsPageState {
  final int steps;

  CountStepsState({required this.steps});
}

class CaloriesCountState extends AnalyticsPageState {
  final int calories;

  CaloriesCountState({
    required this.calories
  });
}

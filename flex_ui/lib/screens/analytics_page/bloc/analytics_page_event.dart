part of 'analytics_page_bloc.dart';

@immutable
abstract class AnalyticsPageEvent {}

class TodayDateEvent extends AnalyticsPageEvent {}

class CountStepsEvent extends AnalyticsPageEvent {
  final int steps;

  CountStepsEvent({required this.steps});
}

class CaloriesCountEvent extends AnalyticsPageEvent {
  final int calories;

  CaloriesCountEvent({
    required this.calories
  });
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'analytics_page_event.dart';
part 'analytics_page_state.dart';

class AnalyticsPageBloc extends Bloc<AnalyticsPageEvent, AnalyticsPageState> {
  AnalyticsPageBloc() : super(AnalyticsPageInitial());

  Stream<AnalyticsPageState> mapEventToState(AnalyticsPageEvent event) async* {
    if (event is TodayDateEvent) {
      yield TodayDateState();
    } else if (event is CountStepsEvent) {
      yield CountStepsState(
        steps: event.steps,
      );
    } else if (event is CaloriesCountEvent) {
      yield CaloriesCountState(
        calories: event.calories,
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(ReminderInitial());

  int? selectRepeatDayIndex;
  DateTime reminderTime;
  int? dayTime;

  @override
  Stream<ReminderState> mapEventToState(
    ReminderEvent event,
  ) async* {
    if (event is RepeatDaySelectedEvent) {
      selectRepeatDayIndex = event.index;
      dayTime = event.dayTime;
      yield RepeatDaySelectedState(index: selectRepeatDayIndex);
    } else if (event is ReminderNotificationTimeEvent) {
      reminderTime = event.dateTime;
      yield ReminderNotificationState();
    } else if (event is OnSaveTappedEvent) {
      _scheduleAtParticularTime(reminderTime, dayTime);
      yield OnSaveTappedState();
    }
  }

  Future _scheduleAtParticularTime(DateTime dateTime, int? dayTime) async {
    final flutterNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final androidPlatformChannelSpecifics =
        // ignore: prefer_const_constructors
        AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
    );
    const iOSPlatformSpecifics = IOSNotificationDetails();
    NotificationDetails platfromChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformSpecifics);

    await flutterNotificationsPlugin.zonedSchedule(
      1,
      'Flex fitness',
      'Hello, it\'s time for a workout',
      _scheduledWeekly(dateTime, days: _createNotificationDayOfTheWeek(dayTime)),
      platfromChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime
    );
  }
  tz.TZDateTime
}

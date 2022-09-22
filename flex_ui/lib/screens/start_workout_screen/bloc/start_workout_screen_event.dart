part of 'start_workout_screen_bloc.dart';
@immutable

abstract class StartWorkoutEvent {}

class BackTappedEvent extends StartWorkoutEvent {}

class PlayTappedEvent extends StartWorkoutEvent {
  final int time;

  PlayTappedEvent({required this.time});
}

class PausedTappedEvent extends StartWorkoutEvent {
  final int time;

  PausedTappedEvent({
    required this.time
  });
}

class ChangeTimerState extends StartWorkoutEvent{}

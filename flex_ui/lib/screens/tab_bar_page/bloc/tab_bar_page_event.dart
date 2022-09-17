part of 'tab_bar_page_bloc.dart';

@immutable
abstract class TabBarPageEvent {}

class TabBarItemTappedEvent extends TabBarPageEvent {
  final int index;

  TabBarItemTappedEvent({
    required this.index
  });
}
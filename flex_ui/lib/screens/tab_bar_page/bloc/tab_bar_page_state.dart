part of 'tab_bar_page_bloc.dart';

@immutable
abstract class TabBarPageState {}

class TabBarPageInitial extends TabBarPageState {}

class TabBarItemSelectedState extends TabBarPageState {
  final int index;

  TabBarItemSelectedState ({
    required this.index
  });
}

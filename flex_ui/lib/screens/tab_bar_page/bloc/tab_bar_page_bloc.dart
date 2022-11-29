import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'tab_bar_page_event.dart';
part 'tab_bar_page_state.dart';

class TabBarPageBloc extends Bloc<TabBarPageEvent, TabBarPageState> {
  TabBarPageBloc() : super(TabBarPageInitial()) {
    on<TabBarItemTappedEvent>((event, emit) async {
      emit(TabBarItemSelectedState(index: currentIndex));
    });
  }

  int currentIndex = 0;
  bool isSelected = false;

  Stream<TabBarPageState> mapEventToState(TabBarPageEvent event) async* {
    if (event is TabBarItemTappedEvent) {
      currentIndex = event.index;
      yield TabBarItemSelectedState(index: currentIndex);
    }
  }
}

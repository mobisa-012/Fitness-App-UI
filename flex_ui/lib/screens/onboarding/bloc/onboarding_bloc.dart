import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial());

  int pageIndex = 0;

  final pageController = PageController(initialPage: 0);

  Stream<OnboardingState> mapEventToState(
    OnboardingEvent event,
  ) async* {
    if (event is PageChangedEvent) {
      if (pageIndex == 2) {
        yield NextScreenState();
        return;
      }
      pageIndex += 1;

      pageController.animateToPage(
        pageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );

      yield PageChangedState(counter: pageIndex);
    } else if (event is PageSwipedEvent) {
      pageIndex = event.index;
      yield PageChangedState(counter: pageIndex);
    }
  }
}
import 'package:flex_ui/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:flex_ui/screens/onboarding/bloc/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/onboarding_content.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<OnboardingBloc> _buildBody(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (BuildContext context) => OnboardingBloc(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listenWhen: (_, currState) => currState is NextScreenState,
        listener: (context, state) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
            return SignUpPage();
          }));
        },
        builder: (context, state) {
          return const OnboardingContent();
        },
        buildWhen: (_, currState) => currState is OnboardingInitial,
      ),
    );
  }
}

import 'package:flex_ui/screens/analytics_page/bloc/analytics_page_bloc.dart';
import 'package:flex_ui/screens/analytics_page/widgets/analytics_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(context),
    );
  }

  BlocProvider<AnalyticsPageBloc> _buildContext(BuildContext context) {
    return BlocProvider<AnalyticsPageBloc>(
      create: (context) => AnalyticsPageBloc(),
      child: BlocConsumer<AnalyticsPageBloc, AnalyticsPageState>(
        buildWhen: (_, currState) => currState is AnalyticsPageInitial,
        builder: (context, state) {
          return const AnalyticsContent();
        },
        listenWhen: (_, currState) => true,
        listener: (context, state) {},
      ),
    );
  }
}

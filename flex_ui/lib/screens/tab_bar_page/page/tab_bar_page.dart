import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/screens/analytics_page/page/analytics_page.dart';
import 'package:flex_ui/screens/home/page/home_page.dart';
import 'package:flex_ui/screens/profile_page/page/profile_page.dart';
import 'package:flex_ui/screens/tab_bar_page/bloc/tab_bar_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TabBarPageBloc(),
      child: BlocConsumer<TabBarPageBloc, TabBarPageState>(
        listener: (context, state) {},
        buildWhen: (_, currState) =>
            currState is TabBarPageInitial ||
            currState is TabBarItemSelectedState,
        builder: (context, state) {
          final bloc = BlocProvider.of<TabBarPageBloc>(context);
          return Scaffold(
            body: _createBody(context, bloc.currentIndex),
            bottomNavigationBar: _createBottomBar(context),
          );
        },
      ),
    );
  }

  Widget _createBottomBar(BuildContext context) {
    final bloc = BlocProvider.of<TabBarPageBloc>(context);
    return BottomNavigationBar(
      currentIndex: bloc.currentIndex,
      fixedColor: AppColors.onboardingColor,
      items: [
         BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage(PathConstatnts.home),
              color: bloc.currentIndex == 0 ? AppColors.onboardingColor : null,
            ),
            label: TextConstants.home),
        BottomNavigationBarItem(
            icon: Image(
                image: const AssetImage(PathConstatnts.analytics),
                color:
                    bloc.currentIndex == 1 ? AppColors.onboardingColor : null),
            label: TextConstants.analytics),
        BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage(PathConstatnts.account),
              color: bloc.currentIndex == 2 ? AppColors.onboardingColor : null,
            ),
            label: TextConstants.me)
      ],
      onTap: (index) {
        bloc.add(TabBarItemTappedEvent(index));
      },
    );
  }

  Widget _createBody(BuildContext context, int index) {
    final children = [const HomePage(), const AnalyticsPage(), const ProfilePage()];
    return children[index];
  }
}

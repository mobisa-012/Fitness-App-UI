import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/screens/tab_bar_page/bloc/tab_bar_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarPageBloc>(
      create: (BuildContext context) => TabBarPageBloc(),
      child: BlocConsumer<TabBarPageBloc, TabBarPageState>(
        buildWhen: (_, currState) =>
            currState is TabBarPageInitial ||
            currState is TabBarItemSelectedState,
        builder: (context, state) {
          final bloc = BlocProvider.of<TabBarPageBloc>(context);
          return Scaffold(
            body: _createBody(context, bloc.currentIndex),
            bottomNavigationBar: _createdBottomTabBar(context),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _createdBottomTabBar(BuildContext context) {
    final bloc = BlocProvider.of<TabBarPageBloc>(context);
    return BottomNavigationBar(
      currentIndex: bloc.currentIndex,
      fixedColor: AppColors.weightLossContainerColor,
      items: [
        BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage(PathConstatnts.home),
              color: bloc.currentIndex == 0
                  ? AppColors.weightLossContainerColor
                  : null,
            ),
            label: TextConstants.home),
        BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage(PathConstatnts.analytics),
              color: bloc.currentIndex == 1
                  ? AppColors.weightLossContainerColor
                  : null,
            ),
            label: TextConstants.home),
        BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage(PathConstatnts.account),
              color: bloc.currentIndex == 2
                  ? AppColors.weightLossContainerColor
                  : null,
            ),
            label: TextConstants.home),
      ],
      onTap: (index) {
        bloc.add(TabBarItemTappedEvent(index: index));
      },
    );
  }

  Widget _createBody(BuildContext context, int index) {
    final children = [HomePage(), AnalyticsPage(), ProfilePage()];
    return children[index];
  }
}

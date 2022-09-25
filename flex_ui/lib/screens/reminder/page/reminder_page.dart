import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/screens/common_widgets/fitness_button.dart';
import 'package:flex_ui/screens/reminder/bloc/reminder_bloc.dart';
import 'package:flex_ui/screens/reminder/widget/reminder_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReminderBloc>(
      create: (context) => ReminderBloc(),
      child: BlocBuilder(
        buildWhen: (_, currState) => currState is ReminderInitial,
        builder: (context, state) {
          return Scaffold(
            body: _buildContext(context),
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 0,
              title: const Text(
                TextConstants.reminder,
                style: TextStyle(color: AppColors.loadingBlack, fontSize: 18),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.weightLossContainerColor,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FitnessButton(
                title: TextConstants.save,
                onTap: () {
                  final bloc = BlocProvider.of<ReminderBloc>(context);
                  bloc.add(OnSaveTappedEvent());
                },
              ),
            ),
          );
        },
      ),
    );
  }

  BlocConsumer<ReminderBloc, ReminderState> _buildContext(
      BuildContext context) {
    return BlocConsumer(
      buildWhen: (_, currState) => currState is ReminderInitial,
      builder: (context, state) {
        if (state is ReminderInitial) {
          BlocProvider.of<ReminderBloc>(context)
              .add(ReminderNotificationTimeEvent(dateTime: DateTime.now()));
        }
        return const ReminderContent();
      },
      listenWhen: (_, currState) => currState is OnSaveTappedState,
      listener: (context, state) {
        Navigator.of(context).pop();
      },
    );
  }
}

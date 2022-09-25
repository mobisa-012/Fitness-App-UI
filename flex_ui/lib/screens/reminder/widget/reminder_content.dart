import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/data_constants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/screens/reminder/bloc/reminder_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReminderContent extends StatelessWidget {
  const ReminderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.homeBackground,
      child: _createDetailedReminder(context),
    );
  }

  Widget _createDetailedReminder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createSelectTime(),
              const SizedBox(
                height: 20,
              ),
              _createTimePicker(context),
              const SizedBox(
                height: 20,
              ),
              _createRepeating(),
              const SizedBox(
                height: 15,
              ),
              _createDayRepeating(context),
            ],
          )
        ],
      ),
    );
  }

  Widget _createSelectTime() {
    return const Text(
      TextConstants.selectTime,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  Widget _createTimePicker(BuildContext context) {
    final bloc = BlocProvider.of<ReminderBloc>(context);
    return Container(
      height: 250,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: (DateTime value) {
          bloc.add(ReminderNotificationTimeEvent(dateTime: value));
        },
      ),
    );
  }

  Widget _createRepeating() {
    return const Text(
      TextConstants.repeating,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _createDayRepeating(BuildContext context) {
    final bloc = BlocProvider.of<ReminderBloc>(context);
    return BlocBuilder<ReminderBloc, ReminderState>(
      buildWhen: (_, currState) => currState is RepeatDaySelectedState,
      builder: (context, state) {
        return Wrap(
          spacing: 10,
          runSpacing: 15,
          children: [
            for (int i = 0; i < DataConstants.reminderDays.length; i++) ...[
              RepeatingDay(
                  title: DataConstants.reminderDays[i],
                  isSelected: bloc.selectRepeatDayIndex == i,
                  onTap: () {
                    bloc.add(RepeatDaySelectedEvent(
                        index: i, dayTime: bloc.dayTime = i));
                  })
            ]
          ],
        );
      },
    );
  }
}

class RepeatingDay extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const RepeatingDay(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.weightLossContainerColor: AppColors.categoriesWorkoutsTextColor.withOpacity(0.18),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.homeBackground : AppColors.categoriesWorkoutsTextColor
          ),
        ),
      ),
    );
  }
}

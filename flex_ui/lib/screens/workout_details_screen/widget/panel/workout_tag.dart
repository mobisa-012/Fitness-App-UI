import 'package:flex_ui/core/const/colors.dart';
import 'package:flutter/cupertino.dart';

class WorkoutTag extends StatelessWidget {
  final String icon;
  final String content;

  const WorkoutTag({super.key, required this.icon, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.onboardingColor.withOpacity(0.12),
      ),
      child: Row(
        children: [
          Image.asset(icon, height: 17, width: 17, fit: BoxFit.fill),
          const SizedBox(width: 7),
          Text(content, style: const TextStyle(color: AppColors.onboardingColor, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
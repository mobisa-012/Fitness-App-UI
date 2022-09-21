import 'dart:ui';

import 'package:flex_ui/core/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkoutTag extends StatelessWidget {
  final String icon;
  final String content;

  const WorkoutTag({Key? key, required this.icon, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.weightLossContainerColor.withOpacity(012)
        ),
        child: Row(
          children: [
            Image.asset(icon, height: 17, width: 17, fit: BoxFit.fill,),
            const SizedBox(width: 7,),
            Text(
              content,
              style: const TextStyle(
                color: AppColors.loadingBlack,
                fontSize: 14,
                fontWeight:  FontWeight.w500
              ),
            ),
          ],
        ),
    );
  }
}

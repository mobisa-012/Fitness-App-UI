import 'package:flex_ui/core/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FitnessLoading extends StatelessWidget {
  const FitnessLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.loadingBlack,
      child: Center(
        child: Theme(
          data: ThemeData(
            cupertinoOverrideTheme: const CupertinoThemeData (
              brightness: Brightness.dark),
            ), 
            child: const CupertinoActivityIndicator(
              radius: 17,
            )),
      ),
    );
  }
}

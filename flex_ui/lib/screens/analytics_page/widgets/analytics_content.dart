// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/screens/analytics_page/bloc/analytics_page_bloc.dart';
import 'package:flex_ui/screens/analytics_page/widgets/analytics.dart';
import 'package:flex_ui/screens/edit_account_screen/page/edit_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

class AnalyticsContent extends StatefulWidget {
  const AnalyticsContent({super.key});

  @override
  State<AnalyticsContent> createState() => _AnalyticsContentState();
}

class _AnalyticsContentState extends State<AnalyticsContent> {
  int water = 0;
  int weight = 50;
  double height = 1.0;
  double? resultBMI;
  String message = 'Enter your weight and height';

  void bmiresult() async {
    final heightValue = height;
    final double heightSquare = heightValue * heightValue;
    final weightValue = weight;

    setState(() {
      resultBMI = weightValue / heightSquare;
      if (resultBMI! < 18.5) {
        message = 'You\'re underweight';
      } else if (resultBMI! < 25) {
        message = 'You\'re healthy';
      } else if (resultBMI! < 30) {
        message = 'You are overweight';
      } else {
        message = 'You are obese';
      }
    });
  }

  void incrementWater() {
    setState(() {
      water++;
    });
  }

  void decrementWater() {
    setState(() {
      water--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.homeBackground,
      height: double.infinity,
      width: double.infinity,
      child: _createAnalyticsBody(context),
    );
  }

  Widget _createAnalyticsBody(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          _createProfileData(context),
          const SizedBox(
            height: 20,
          ),
          const Analytics(),
          const SizedBox(
            height: 30,
          ),
          _createMetrics(context),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  Widget _createProfileData(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? 'No username';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Hey, $displayName',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                TextConstants.letsCheckActivity,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          BlocBuilder<AnalyticsPageBloc, AnalyticsPageState>(
              buildWhen: (_, currState) => currState is ReloadImageState,
              builder: (context, state) {
                final photoUrl = FirebaseAuth.instance.currentUser?.photoURL;
                return GestureDetector(
                  child: photoUrl == null
                      ? const CircleAvatar(
                          backgroundImage:
                              AssetImage(PathConstatnts.profileAvatar),
                          radius: 40,
                        )
                      : CircleAvatar(
                          radius: 25,
                          child: ClipOval(
                            child: FadeInImage.assetNetwork(
                              placeholder: PathConstatnts.profileAvatar,
                              image: photoUrl,
                              fit: BoxFit.cover,
                              width: 180,
                              height: 120,
                            ),
                          ),
                        ),
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>  const EditAccountScreen()));
                    BlocProvider.of<AnalyticsPageBloc>(context)
                        .add(ReloadImageEvent());
                  },
                );
              })
        ],
      ),
    );
  }

  Widget _createMetrics(BuildContext context) {
  //int weight = 50;
  //double height = 1.0;
    return Column(
      children: [
        //water container
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.homeBackground,
            boxShadow: [
              BoxShadow(
                  color: AppColors.textColor.withOpacity(0.1),
                  blurRadius: 5.0,
                  spreadRadius: 1.1),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    TextConstants.water,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$water ' 'glass',
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w200,
                        color: Colors.blue),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: incrementWater,
                    child: const Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: decrementWater,
                    child: const Icon(
                      Icons.remove,
                      size: 25,
                      color: Colors.blue,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        //weight picker
        Center(
          child: Container(
            height: 200,
            width: 300,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.black12.withOpacity(0.1),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Weight (kg)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Center(
                    child: NumberPicker(
                      value: weight,
                      minValue: 10,
                      maxValue: 120,
                      onChanged: (value) => setState(() => weight = value),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        //container showing weight
        Container(
          padding: const EdgeInsets.all(8),
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.homeBackground,
            boxShadow: [
              BoxShadow(
                  color: AppColors.textColor.withOpacity(0.1),
                  blurRadius: 5.0,
                  spreadRadius: 1.1),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your weight is',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    color: AppColors.textColor),
              ),
              Text(
                '$weight kg',
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15,
                  fontFamily: 'Roboto'
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //slider height picker
        Slider(
                value: height,
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.grey.withOpacity(0.5),
                max: 2.0,
                min: 1.0,
                divisions: 20,
                //label: height.round().toString(),
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                }),
        //container showing height
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.homeBackground,
            boxShadow: [
              BoxShadow(
                  color: AppColors.textColor.withOpacity(0.1),
                  blurRadius: 5.0,
                  spreadRadius: 1.1),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your height is',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
              ),
              Text(
                '$height m',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //know your BMI Button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 0,
          ),
          onPressed: bmiresult,
          child: const Text(
            'Know your BMI',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          resultBMI == null ? 'No BMI result' : resultBMI!.toStringAsFixed(2),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          message,
          textAlign: TextAlign.end,
          style: const TextStyle(
              fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}

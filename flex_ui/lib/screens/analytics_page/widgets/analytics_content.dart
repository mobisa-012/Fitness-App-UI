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
        message = 'Your body is fine';
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
            height: 35,
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
    final displayName = user?.displayName ?? 'Ni username';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Hey, $displayName',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                TextConstants.letsCheckActivity,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                          radius: 60,
                        )
                      : CircleAvatar(
                          radius: 25,
                          child: ClipOval(
                            child: FadeInImage.assetNetwork(
                              placeholder: PathConstatnts.profileAvatar,
                              image: photoUrl,
                              fit: BoxFit.cover,
                              width: 200,
                              height: 120,
                            ),
                          ),
                        ),
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const EditAccountScreen()));
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
    int weight = 0;
    double height = 80;
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.homeBackground,
              boxShadow: [
                BoxShadow(
                    color:
                        AppColors.categoriesWorkoutsTextColor.withOpacity(0.12),
                    blurRadius: 5.0,
                    spreadRadius: 1.1)
              ]),
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
                    '$water ' 'glasses',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: AppColors.textColor),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: incrementWater,
                    child: const Icon(
                      Icons.remove,
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
          height: 5,
        ),
        Center(
          child: Container(
            height: 150,
            width: 300,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Weight (kg)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Center(
                  child: NumberPicker(
                    value: weight,
                    minValue: 10,
                    maxValue: 150,
                    onChanged: (value) => setState(() {
                      weight = value;
                    }),
                  ),
                )
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
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.weightLossContainerColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your weight is',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textColor),
              ),
              Text(
                '$weight kg',
                style: const TextStyle(
                  color: AppColors.homeBackground,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Slider(
            value: height,
            activeColor: AppColors.weightLossContainerColor,
            inactiveColor: Colors.grey.withOpacity(0.5),
            max: 250,
            divisions: 20,
            label: height.round().toString(),
            onChanged: (double value) {
              setState(() {
                height = value;
              });
            }),
        //container showing height
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.lightBlueAccent.withOpacity(0.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your height is',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                '$height cm',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                elevation: 0
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
        Text(
              resultBMI == null
                  ? 'No BMI result'
                  : resultBMI!.toStringAsFixed(2),
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
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            )
      ],
    );
  }
}

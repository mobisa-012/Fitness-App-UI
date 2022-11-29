// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/data_constants.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/screens/edit_account_screen/page/edit_account_screen.dart';
import 'package:flex_ui/screens/home/bloc/home_bloc.dart';
import 'package:flex_ui/screens/home/widget/home_exercises_card.dart';
import 'package:flex_ui/screens/workout_details_screen/page/workoutdetails_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.homeBackground,
      height: double.infinity,
      width: double.infinity,
      child: _createHomeBody(context),
    );
  }

  Widget _createHomeBody(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          _createProfileData(context),
          const SizedBox(height: 20),
          _createExercisesList(context),
          const SizedBox(height: 25),
          _createExercisesCategoriesList(context),
          const SizedBox(height: 25),
          _createChallengeCategory(context),
        ],
      ),
    );
  }

  Widget _createExercisesList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            TextConstants.topWorkouts,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 20),
              WorkoutCard(
                  color: AppColors.weightLossContainerColor,
                  workout: DataConstants.homeWorkoutsTopWorkouts[0],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[0],
                          )))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: AppColors.absContainerColor,
                  workout: DataConstants.homeWorkoutsTopWorkouts[1],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[1],
                          )))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: AppColors.cardioColor,
                  workout: DataConstants.homeWorkoutsTopWorkouts[2],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[2],
                          )))),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createExercisesCategoriesList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            TextConstants.categories,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 20),
              WorkoutCard(
                  color: AppColors.yogaContainerColor,
                  workout: DataConstants.categoriesWorkouts[0],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[3],
                          )))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: AppColors.thighsContainerColor,
                  workout: DataConstants.categoriesWorkouts[1],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[4],
                          )))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: AppColors.pilatesContainerColor,
                  workout: DataConstants.categoriesWorkouts[2],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[5],
                          )))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: AppColors.bootyTrainingContainerColor,
                  workout: DataConstants.categoriesWorkouts[3],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[6],
                          )))),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createProfileData(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? "No Username";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, $displayName',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                TextConstants.letsCheckActivity,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (_, currState) => currState is ReloadImageState,
            builder: (context, state) {
              final photoUrl = FirebaseAuth.instance.currentUser?.photoURL;
              return GestureDetector(
                child: photoUrl == null
                    ? const CircleAvatar(
                        backgroundImage:
                            AssetImage(PathConstatnts.profileAvatar),
                        radius: 50)
                    : CircleAvatar(
                        radius: 23,
                        child: ClipOval(
                            child: FadeInImage.assetNetwork(
                                placeholder: PathConstatnts.profileAvatar,
                                image: photoUrl,
                                fit: BoxFit.cover,
                                width: 150,
                                height: 120))),
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const EditAccountScreen()));
                  BlocProvider.of<HomeBloc>(context).add(ReloadImageEvent());
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _createChallengeCategory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Booty Challenge',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 20),
              WorkoutCard(
                  color: AppColors.yogaContainerColor,
                  workout: DataConstants.categoriesWorkouts[0],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[3],
                          )))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: AppColors.thighsContainerColor,
                  workout: DataConstants.categoriesWorkouts[1],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[4],
                          )))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: AppColors.pilatesContainerColor,
                  workout: DataConstants.categoriesWorkouts[2],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[5],
                          )))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: AppColors.bootyTrainingContainerColor,
                  workout: DataConstants.categoriesWorkouts[3],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[6],
                          )))),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}
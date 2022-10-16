import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/data/exercise_data.dart';
import 'package:flex_ui/data/workout_data.dart';
import 'package:flex_ui/screens/onboarding/widget/onboarding_tile.dart';
import 'package:flutter/cupertino.dart';

// onboarding screen
class DataConstants {
  static final onboardingTiles = [
    const OnboardingTile(
      title: TextConstants.onboarding1Title,
      imaPath: PathConstatnts.onboarding1,
      mainText: TextConstants.onboarding1Description,
    ),
    const OnboardingTile(
      title: TextConstants.onboarding2Title,
      mainText: TextConstants.onboarding2Description,
      imaPath: PathConstatnts.onboarding2,
    ),
    const OnboardingTile(
      imaPath: PathConstatnts.onboarding3,
      mainText: TextConstants.onboarding3Description,
      title: TextConstants.onboarding3Title,
    )
  ];

  static final List<WorkoutData> homeWorkoutsTopWorkouts = [
    WorkoutData(
      //weight losss container
      currentProgress: 0, 
      exercises: TextConstants.fullBodyWorkout,  
      image: PathConstatnts.fullbody, 
      minutes: TextConstants.time, 
      progress: 0, 
      title: TextConstants.weightLossTraining,
      exerciseDataList: [
        ExerciseData(
          title: TextConstants.highKness,
          minutes: TextConstants.highKnessMin,
          progress: 0,
          video: PathConstatnts.highKnees,
          description: TextConstants.highKneesDescription,
          image: '', 
          steps: [
            TextConstants.highKneesDescription1,
            TextConstants.highKneesDescription2,
            TextConstants.highKneesDescription3,
            TextConstants.highKneesDescription4,
            TextConstants.highKneesDescription5,
            TextConstants.highKneesDescription6,
          ],
        ),
        ExerciseData(
          title: TextConstants.squats,
          minutes: TextConstants.squatsMin,
          progress: 0,
          video: PathConstatnts.squatsVideo,
          description: TextConstants.squatsDescription,
          image: '', 
          steps: [
            TextConstants.squatsDescription1,
            TextConstants.squatsDescription2,
            TextConstants.squatsDescription3
          ],
        ),
        ExerciseData(
          title: TextConstants.jumpRope,
          minutes: TextConstants.jumpRopeMin,
          progress: 0,
          video: PathConstatnts.jumpRope,
          description: TextConstants.jumpRopeDescription,
          image: '', 
          steps: [
            TextConstants.jumpRopeDescription1,
            TextConstants.jumpRopeDescription2,
            TextConstants.jumpRopeDescription3,
            TextConstants.jumpRopeDescription4,
            TextConstants.jumpRopeDescription5,
            TextConstants.jumpRopeDescription6,
            TextConstants.jumpRopeDescription7,
            TextConstants.jumpRopeDescription8,
            TextConstants.jumpRopeDescription9
            ],
        ),
        ExerciseData(
          title: TextConstants.jumpingJack,
          minutes: TextConstants.jumpingJackMin,
          progress: 0,
          video: PathConstatnts.jumpingJacks,
          description: TextConstants.jumpingJacksDescription,
          image: '', 
          steps: [
            TextConstants.jumpingJackDescription1,
            TextConstants.jumpingJackDescription2,
            TextConstants.jumpingJackDescription3,
            TextConstants.jumpingJackDescription4
          ],
        ),
        ExerciseData(
          title: TextConstants.highPlank,
          minutes: TextConstants.highPlankMin,
          progress: 0,
          video: PathConstatnts.plank,
          description: TextConstants.highPlankDescription,
          image: '', 
          steps: [
            TextConstants.highKneesDescription1,
            TextConstants.highKneesDescription2,
            TextConstants.highKneesDescription3,
            TextConstants.highKneesDescription4,
            TextConstants.highKneesDescription5,
            TextConstants.highKneesDescription6
          ],
        ),
        ExerciseData(
          title: TextConstants.toeTouches,
          minutes: TextConstants.toeTouchesMin,
          progress: 0,
          video: PathConstatnts.toeTouches,
          description: TextConstants.toeTouchesDescription,
          image: '', 
          steps: [
            TextConstants.toeTouchesDescription1,
            TextConstants.toeTouchesDescription2,
            TextConstants.toeTouchesDescription3,
            TextConstants.toeTouchesDescription4
          ],
        ),
        ]
      ),

      //Abs container
      WorkoutData(
        minutes: TextConstants.absMinutes,
        currentProgress: 0, 
        exercises: TextConstants.abs, 
        exerciseDataList: [
          ExerciseData(
          title: TextConstants.crunchKicks,
          description: TextConstants.crunchKicksDescription, 
          image: '', 
          steps: [
            TextConstants.crunchKicksDescription1,
            TextConstants.crunchKicksDescription2,
            TextConstants.crunchKicksDescription3,
            TextConstants.crunchKicksDescription4
          ], 
          minutes: TextConstants.crunchKicksMin, 
          progress: 0, 
          video: PathConstatnts.crunchKicks,
        ),
        ExerciseData(
          title: TextConstants.russianTwist,
          description: TextConstants.russianTwistDescription, 
          image: '', 
          steps: [
            TextConstants.russianTwistDescription1,
            TextConstants.russianTwistDescription2,
            TextConstants.russianTwistDescription3,
            TextConstants.russianTwistDescription4,
            TextConstants.russianTwistDescription5
          ], 
          minutes: TextConstants.russianTwistMin, 
          progress: 0, 
          video: PathConstatnts.russianTwist,
        ),
        ExerciseData(
          title: TextConstants.slowMountainClimber,
          description: TextConstants.mountainClimberDescription,
          image: '', 
          steps: [            
            TextConstants.mountainClimberDescription1,
            TextConstants.mountainClimberDescription2,
            TextConstants.mountainClimberDescription3,
            TextConstants.mountainClimberDescription4,
            TextConstants.mountainClimberDescription5
          ], 
          minutes: TextConstants.mountainClimberMin, 
          progress: 0, 
          video: PathConstatnts.mountainClimber,
        ),
        ExerciseData(
          title: TextConstants.abHold,
          description: TextConstants.abHoldDescription, 
          image: '', 
          steps: [
            TextConstants.abHoldDescription1,
            TextConstants.abHoldDescription2
          ], 
          minutes: TextConstants.abHoldMin, 
          progress: 0, 
          video: PathConstatnts.abhold,
        ),
        ExerciseData(
          title: TextConstants.reversecrunches,
          description: TextConstants.reversecrunchesDescription, 
          image: '', 
          steps: [
            TextConstants.reversecrunchesDescription1,
            TextConstants.reversecrunchesDescription2,
            TextConstants.reversecrunchesDescription3,
            TextConstants.reversecrunchesDescription4,
            TextConstants.reversecrunchesDescription5,
            TextConstants.reversecrunchesDescription6,
            TextConstants.reversecrunchesDescription7
            ], 
          minutes: TextConstants.reversecrunchesMin, 
          progress: 0, 
          video: PathConstatnts.reverseCrunch,
        ),
        ExerciseData(
          title: TextConstants.rightSideCrunch,
          description: TextConstants.sideCrunchDescription, 
          image: '', 
          steps: [
            TextConstants.rightSideCrunchDescription1,
            TextConstants.rightSideCrunchDescription2,
            TextConstants.rightSideCrunchDescription3,
            TextConstants.rightSideCrunchDescription4,
            TextConstants.rightSideCrunchDescription5,
            TextConstants.rightSideCrunchDescription6
          ], 
          minutes: TextConstants.rightSideCrunchMin, 
          progress: 0, 
          video: PathConstatnts.sideCrunch,
        ),
        ExerciseData(
          title: TextConstants.leftSideCrunch,
          description: TextConstants.sideCrunchDescription, 
          image: '', 
          steps: [
            TextConstants.leftSideCrunchDescription1,
            TextConstants.leftSideCrunchDescription2,
            TextConstants.leftSideCrunchDescription3,
            TextConstants.leftSideCrunchDescription4,
            TextConstants.leftSideCrunchDescription5,
            TextConstants.leftSideCrunchDescription6
          ], 
          minutes: TextConstants.leftSideCrunchMin, 
          progress: 0, 
          video: PathConstatnts.sideCrunch,
        ),
         ],
        image: '', 
        progress: 0, 
        title: TextConstants.abs,
        ),
        //Cardio
        WorkoutData(
          currentProgress: 0, 
          exercises: TextConstants.cardio, 
          exerciseDataList: [
            ExerciseData(
              description: TextConstants.jumpRopeDescription, 
              image: '', 
              minutes: TextConstants.jumpRopeMin, 
              progress: 0, 
              title: TextConstants.jumpRope, 
              video: PathConstatnts.jumpRope, 
              steps: [
                TextConstants.jumpRopeDescription1,
                TextConstants.jumpRopeDescription2,
                TextConstants.jumpRopeDescription3,
                TextConstants.jumpRopeDescription4,
                TextConstants.jumpRopeDescription5,
                TextConstants.jumpRopeDescription6,
                TextConstants.jumpRopeDescription7,
                TextConstants.jumpRopeDescription8,
                TextConstants.jumpRopeDescription9
              ],
              ),
              ExerciseData(
              description: TextConstants.sideHopDescription, 
              image: '', 
              minutes: TextConstants.sideHopMin, 
              progress: 0, 
              title: TextConstants.sideHop, 
              video: PathConstatnts.sideToSideHop, 
              steps: [
                TextConstants.sideHopDescription1,
                TextConstants.sideHopDescription2,
                TextConstants.sideHopDescription3,
                TextConstants.sideHopDescription4
              ],
              ),
              ExerciseData(
              description: TextConstants.jumpingJacksDescription, 
              image: '', 
              minutes: TextConstants.jumpingJackMin, 
              progress: 0, 
              title: TextConstants.jumpingJack, 
              video: PathConstatnts.jumpingJacks, 
              steps: [
                TextConstants.jumpingJackDescription1,
                TextConstants.jumpingJackDescription2,
                TextConstants.jumpingJackDescription3,
                TextConstants.jumpingJackDescription4,
                ],
              ),
              ExerciseData(
              description: TextConstants.highKneesDescription, 
              image: '', 
              minutes: TextConstants.highKnessMin, 
              progress: 0, 
              title: TextConstants.highKness, 
              video: PathConstatnts.highKnees, 
              steps: [
                TextConstants.highKneesDescription1,
                TextConstants.highKneesDescription2,
                TextConstants.highKneesDescription3,
                TextConstants.highKneesDescription4,
                TextConstants.highKneesDescription5,
                TextConstants.highKneesDescription6
              ],
              )
          ], 
          image: '', 
          minutes: TextConstants.cardioMinutes, 
          progress: 0, 
          title: TextConstants.cardio,
          ),
  ];

  static final List<WorkoutData> categoriesWorkouts = [
    //Yoga container
    WorkoutData(
      currentProgress: 0, 
      exercises: TextConstants.yoga, 
      exerciseDataList: [
        ExerciseData(
        description: TextConstants.cowPoseDescription, 
        image: '', 
        minutes: TextConstants.cowPoseMin, 
        progress: 0, 
        title: TextConstants.cowPose, 
        video: PathConstatnts.cowPose, 
        steps: [
          TextConstants.cowPoseDescription1,
          TextConstants.cowPoseDescription2,
          TextConstants.cowPoseDescription3,
          TextConstants.cowPoseDescription4,
          TextConstants.cowPoseDescription5,
          TextConstants.cowPoseDescription6
        ],
        ),
        ExerciseData(
        description: TextConstants.childPoseDescription, 
        image: PathConstatnts.childPose, 
        minutes: TextConstants.childPoseMin, 
        progress: 0, 
        title: TextConstants.childPose, 
        video: PathConstatnts.childPose, 
        steps: [
          TextConstants.childPoseDescription1,
          TextConstants.childPoseDescription2,
          TextConstants.childPoseDescription3,
          TextConstants.childPoseDescription4,
          TextConstants.childPoseDescription5,
          TextConstants.childPoseDescription6
        ],
        ),
        ExerciseData(
        description: TextConstants.highLungeDescription, 
        image: '', 
        minutes: TextConstants.highLungeMin, 
        progress: 0, 
        title: TextConstants.highLunge, 
        video: PathConstatnts.highLunge, 
        steps: [
          TextConstants.highLungeDescription1,
          TextConstants.highLungeDescription2,
          TextConstants.highLungeDescription3,
          TextConstants.highLungeDescription4,
          TextConstants.highKneesDescription5,
          TextConstants.highKneesDescription6
        ],
        ),
        ExerciseData(
        description: TextConstants.warriorIIDescription, 
        image: PathConstatnts.warriorII, 
        minutes: TextConstants.warriorIIMin, 
        progress: 0, 
        title: TextConstants.warriorII, 
        video: PathConstatnts.warriorIIPose, 
        steps: [
          TextConstants.warriorIIDescription1,
          TextConstants.warriorIIDescription2,
          TextConstants.warriorIIDescription3,
          TextConstants.warriorIIDescription4,
          TextConstants.warriorIIDescription5
        ],
        ),
        ExerciseData(
        description: TextConstants.downwardDogDescription, 
        image: PathConstatnts.downwardDogImage, 
        minutes: TextConstants.downwardDogMin, 
        progress: 0, 
        title: TextConstants.downwardDog, 
        video: PathConstatnts.downwardDog, 
        steps: [
          TextConstants.downwardDogDescription1,
          TextConstants.downwardDogDescription2,
          TextConstants.downwardDogDescription3,
          TextConstants.downwardDogDescription4,
          TextConstants.downwardDogDescription5,
          TextConstants.downwardDogDescription6,
          TextConstants.downwardDogDescription7,
          TextConstants.downwardDogDescription8,
          TextConstants.downwardDogDescription9
        ],
        ),

        ExerciseData(
        description: TextConstants.upwardDogDescription, 
        image: '', 
        minutes: TextConstants.upwardDogMin, 
        progress: 0, 
        title: TextConstants.upwardDog, 
        video: '', 
        steps: [
          TextConstants.upwardDogDescription1,
          TextConstants.upwardDogDescription2,
          TextConstants.upwardDogDescription3,
          TextConstants.upwardDogDescription4,
          TextConstants.upwardDogDescription5,
          TextConstants.upwardDogDescription6,
          TextConstants.upwardDogDescription7,
          TextConstants.upwardDogDescription8
        ],
        ),
        ExerciseData(
        description: TextConstants.reverseWarriorDescription, 
        image: '', 
        minutes: TextConstants.reverseWarriorMin, 
        progress: 0, 
        title: TextConstants.reverseWarrior, 
        video: PathConstatnts.reverseWarrior, 
        steps: [
          TextConstants.reverseWarriorDescription1,
          TextConstants.reverseWarriorDescription2,
          TextConstants.reverseWarriorDescription3,
          TextConstants.reverseWarriorDescription4
        ],
        ),
        ExerciseData(
        description: TextConstants.highPlankDescription, 
        image: '', 
        minutes: TextConstants.highPlankMin, 
        progress: 0, 
        title: TextConstants.highPlank, 
        video: PathConstatnts.plank, 
        steps: [
          TextConstants.highPlankDescription1,
          TextConstants.highPlankDescription2,
          TextConstants.highPlankDescription3,
          TextConstants.highPlankDescription4
        ],
        ),
      ], 
      image: '', 
      minutes: TextConstants.yogaMinutes, 
      progress: 0, 
      title: TextConstants.yoga,
      ),

      //Thighs
      WorkoutData(
        currentProgress: 0, 
        exercises: TextConstants.thighs, 
        exerciseDataList: [
          ExerciseData(
            description: TextConstants.sumoSquatDescription, 
            image: '', 
            minutes: TextConstants.sumoSquatsMin, 
            progress: 0, 
            title: TextConstants.sumoSquats, 
            video: PathConstatnts.sumoSquats, 
            steps: [
              TextConstants.sumoSquatsDescription1,
              TextConstants.sumoSquatsDescription2,
              TextConstants.sumoSquatsDescription3,
              TextConstants.sumoSquatsDescription4,
              TextConstants.sumoSquatsDescription5,
              TextConstants.sumoSquatsDescription6,
            ],
            ),
            ExerciseData(
            description: TextConstants.donkeyKicksDescription, 
            image: '', 
            minutes: TextConstants.thighdonkeyKicksThighsLeftMin, 
            progress: 0, 
            title: TextConstants.donkeyKicksLeft, 
            video: PathConstatnts.donkeyKicks, 
            steps: [
              TextConstants.donkeyKicksLeftDescription1,
              TextConstants.donkeyKicksLeftDescription2,
              TextConstants.donkeyKicksLeftDescription3,
              TextConstants.donkeyKicksLeftDescription4,
              TextConstants.donkeyKicksLeftDescription5,
            ]
            ),
            ExerciseData(
            description: TextConstants.donkeyKicksDescription, 
            image: '', 
            minutes: TextConstants.thighdonkeyKicksThighsRightMin, 
            progress: 0, 
            title: TextConstants.donkeyKicksRight, 
            video: PathConstatnts.donkeyKicks, 
            steps: [
              TextConstants.donkeyKicksRightDescritption1,
              TextConstants.donkeyKicksRightDescritption2,
              TextConstants.donkeyKicksRightDescritption3,
              TextConstants.donkeyKicksRightDescritption4,
              TextConstants.donkeyKicksRightDescritption5,
            ],
            ),
            ExerciseData(
            description: TextConstants.sideLegLiftLeftDescription, 
            image: '', 
            minutes: TextConstants.sideLegLiftLeftMin, 
            progress: 0, 
            title: TextConstants.sideLegLiftLeft, 
            video: PathConstatnts.sideLegLift, 
            steps: [
              TextConstants.sideLegLiftLeftDescription1,
              TextConstants.sideLegLiftLeftDescription2,
              TextConstants.sideLegLiftLeftDescription3,
              TextConstants.sideLegLiftLeftDescription4,
              TextConstants.sideLegLiftLeftDescription5,
              TextConstants.sideLegLiftLeftDescription6,
              TextConstants.sideLegLiftLeftDescription7,
              TextConstants.sideLegLiftLeftDescription8,
              TextConstants.sideLegLiftLeftDescription9,
            ],
            ),
            ExerciseData(
            description: TextConstants.sideLegLiftLeftDescription, 
            image: '', 
            minutes: TextConstants.sideLegLiftRightMin, 
            progress: 0, 
            title: TextConstants.sideLegLiftRight, 
            video: PathConstatnts.sideLegLift, 
            steps: [
              TextConstants.sideLegLiftRightDescription1,
              TextConstants.sideLegLiftRightDescription2,
              TextConstants.sideLegLiftRightDescription3,
              TextConstants.sideLegLiftRightDescription4,
              TextConstants.sideLegLiftRightDescription5,
              TextConstants.sideLegLiftRightDescription6,
              TextConstants.sideLegLiftRightDescription7,
              TextConstants.sideLegLiftRightDescription8,
              TextConstants.sideLegLiftRightDescription9,
            ],
            ),
            ExerciseData(
            description: TextConstants.sumoSquatDescription, 
            image: '', 
            minutes: TextConstants.sumoSquatsMin, 
            progress: 0, 
            title: TextConstants.sumoSquats, 
            video: PathConstatnts.sumoSquats, 
            steps: [
              TextConstants.thighsSumoSquatsDescription1,
              TextConstants.thighsSumoSquatsDescription2,
              TextConstants.thighsSumoSquatsDescription3,
              TextConstants.thighsSumoSquatsDescription4,
              TextConstants.thighsSumoSquatsDescription5,
              TextConstants.thighsSumoSquatsDescription6,
            ],
            )
        ], 
        image: '', 
        minutes: TextConstants.thighsMinutes, 
        progress: 0, 
        title: TextConstants.thighs,
        ),

        //Pilates container
        WorkoutData(
        currentProgress: 0, 
        exercises: TextConstants.pilates, 
        exerciseDataList: [
          ExerciseData(
            description: TextConstants.crissCrossDescription, 
            image: '', 
            minutes: TextConstants.crissCrossMin, 
            progress: 0, 
            title: TextConstants.crissCross, 
            video: PathConstatnts.crissCross, 
            steps: [
              TextConstants.crissCrossDescription1,
              TextConstants.crissCrossDescription2,
              TextConstants.crissCrossDescription3,
              TextConstants.crissCrossDescription4,
              TextConstants.crissCrossDescription5,
              TextConstants.crissCrossDescription6,
            ],
            ),
            ExerciseData(
            description: TextConstants.doubleLegStretchDescription, 
            image: '', 
            minutes: TextConstants.doubleLegStretchMin, 
            progress: 0, 
            title: TextConstants.doubleLegStretch, 
            video: PathConstatnts.doubleLegStretch, 
            steps: [
              TextConstants.doubleLegStretchDescription1,
              TextConstants.doubleLegStretchDescription2,
              TextConstants.doubleLegStretchDescription3,
              TextConstants.doubleLegStretchDescription4,
              TextConstants.doubleLegStretchDescription5,
              TextConstants.doubleLegStretchDescription6,
              TextConstants.doubleLegStretchDescription7,
              TextConstants.doubleLegStretchDescription8,
              TextConstants.doubleLegStretchDescription9
            ],
            ),
            ExerciseData(
            description: TextConstants.scissorKicksDescription, 
            image: '', 
            minutes: TextConstants.scissorKicksNin, 
            progress: 0, 
            title: TextConstants.scissorKicks, 
            video: PathConstatnts.scissorKicks, 
            steps: [
              TextConstants.scissorKicksDescription1,
              TextConstants.scissorKicksDescription2,
              TextConstants.scissorKicksDescription3,
              TextConstants.scissorKicksDescription4,
              TextConstants.scissorKicksDescription5,
              TextConstants.scissorKicksDescription6
            ],
            ),
            ExerciseData(
            description: TextConstants.plankLegLiftDescription, 
            image: '', 
            minutes: TextConstants.plankLegLiftMin, 
            progress: 0, 
            title: TextConstants.plankLegLift, 
            video: PathConstatnts.plankLegLift, 
            steps: [
              TextConstants.plankLegLiftDescritption1,
              TextConstants.plankLegLiftDescritption2,
              TextConstants.plankLegLiftDescritption3,
              TextConstants.plankLegLiftDescritption4,
              TextConstants.plankLegLiftDescritption5,
              TextConstants.plankLegLiftDescritption6
            ],
            ),
            ExerciseData(
            description: TextConstants.teaserDescription, 
            image: '', 
            minutes: TextConstants.teaserMin, 
            progress: 0, 
            title: TextConstants.teaser, 
            video: PathConstatnts.teaser, 
            steps: [
              TextConstants.teaserDescription1,
              TextConstants.teaserDescription2,
              TextConstants.teaserDescription3,
              TextConstants.teaserDescription4,
              TextConstants.teaserDescription5
            ],
            ),
            ExerciseData(
            description: TextConstants.plankRockDescription, 
            image: '', 
            minutes: TextConstants.plankRockMin, 
            progress: 0, 
            title: TextConstants.plankRock, 
            video: PathConstatnts.plankRock, 
            steps: [
              TextConstants.plankRockDescription1,
              TextConstants.plankRockDescription2,
              TextConstants.plankRockDescription3
            ],
            ),
            ExerciseData(
            description: TextConstants.singleLegStretchDescription, 
            image: '', 
            minutes: TextConstants.singleLegStretchMin, 
            progress: 0, 
            title: TextConstants.singleLegStretch, 
            video: PathConstatnts.singleLegStretch, 
            steps: [
              TextConstants.singleLegStretchDescription1,
              TextConstants.singleLegStretchDescription2,
              TextConstants.singleLegStretchDescription3,
              TextConstants.singleLegStretchDescription4,
              TextConstants.singleLegStretchDescription5
            ],
            ),
            ExerciseData(
            description: TextConstants.pilates100Description, 
            image: '', 
            minutes: TextConstants.pilates100Min, 
            progress: 0, 
            title: TextConstants.pilates100, 
            video: PathConstatnts.pilates100, 
            steps: [
              TextConstants.pilates100Description1,
              TextConstants.pilates100Description2,
              TextConstants.pilates100Description3,
              TextConstants.pilates100Description4,
              TextConstants.pilates100Description5
            ],
            ),
            ExerciseData(
            description: TextConstants.legCircleDescription, 
            image: '', 
            minutes: TextConstants.legCircleMin, 
            progress: 0, 
            title: TextConstants.legCircle, 
            video: PathConstatnts.legCircle, 
            steps: [
              TextConstants.legCircleDescription1,
              TextConstants.legCircleDescription2,
              TextConstants.legCircleDescription3,
              TextConstants.legCircleDescription4,
              TextConstants.legCircleDescription5
            ],
            )
        ], 
        image: '', 
        minutes: TextConstants.pilatesMinutes, 
        progress: 0, 
        title: TextConstants.pilates,
        ),

        //Booty container
        WorkoutData(
        currentProgress: 0, 
        exercises: TextConstants.booty, 
        exerciseDataList: [
          ExerciseData(
            description: TextConstants.highKneesDescription, 
            image: '', 
            minutes: TextConstants.highKnessMin, 
            progress: 0, 
            title: TextConstants.highKness, 
            video: PathConstatnts.highKnees, 
            steps: [
              TextConstants.highKneesDescription1,
              TextConstants.highKneesDescription2,
              TextConstants.highKneesDescription3,
              TextConstants.highKneesDescription4,
              TextConstants.highKneesDescription5,
              TextConstants.highKneesDescription6
            ],
            ),
            ExerciseData(
            description: TextConstants.squatsDescription, 
            image: '', 
            minutes: TextConstants.squatsMin, 
            progress: 0, 
            title: TextConstants.squats, 
            video: PathConstatnts.squats, 
            steps: [
              TextConstants.squatsDescription1,
              TextConstants.squatsDescription2,
              TextConstants.squatsDescription3,
            ],
            ),
            ExerciseData(
            description: TextConstants.donkeyKicksDescription, 
            image: '', 
            minutes: TextConstants.donkeyKicksLeftMin, 
            progress: 0, 
            title: TextConstants.donkeyKicksLeft, 
            video: PathConstatnts.donkeyKicks, 
            steps: [
              TextConstants.donkeyKicksLeftDescription1,
              TextConstants.donkeyKicksLeftDescription2,
              TextConstants.donkeyKicksLeftDescription3,
              TextConstants.donkeyKicksLeftDescription4,
              TextConstants.donkeyKicksLeftDescription5,
            ],
            ),
            ExerciseData(
            description: TextConstants.donkeyKicksDescription, 
            image: '', 
            minutes: TextConstants.donkeyKicksRightMin, 
            progress: 0, 
            title: TextConstants.donkeyKicksRight, 
            video: PathConstatnts.donkeyKicks, 
            steps: [
              TextConstants.donkeyKicksRightDescritption1,
              TextConstants.donkeyKicksRightDescritption2,
              TextConstants.donkeyKicksRightDescritption3,
              TextConstants.donkeyKicksRightDescritption4,
              TextConstants.donkeyKicksRightDescritption5,
            ],
            ),
            ExerciseData(
            description: TextConstants.lungesDescription, 
            image: '', 
            minutes: TextConstants.lungesMin, 
            progress: 0, 
            title: TextConstants.lunges, 
            video: PathConstatnts.lunges, 
            steps: [
              TextConstants.lungesDescription1,
              TextConstants.lungesDescription2,
              TextConstants.lungesDescription3,
              TextConstants.lungesDescription4,
              TextConstants.lungesDescription5
            ],
            ),
            ExerciseData(
            description: TextConstants.buttBridgeDescription, 
            image: '', 
            minutes: TextConstants.buttBridgeMin, 
            progress: 0, 
            title: TextConstants.buttBridge, 
            video: PathConstatnts.buttBridge, 
            steps: [
              TextConstants.buttBridgeDescription1,
              TextConstants.buttBridgeDescription2,
              TextConstants.buttBridgeDescription3,
              TextConstants.buttBridgeDescription4,
              TextConstants.buttBridgeDescription5
            ],
            ),
            ExerciseData(
            description: TextConstants.sumoSquatDescription, 
            image: '', 
            minutes: TextConstants.sumoSquatsMin, 
            progress: 0, 
            title: TextConstants.sumoSquats, 
            video: PathConstatnts.sumoSquats, 
            steps: [
              TextConstants.sumoSquatsDescription1,
              TextConstants.sumoSquatsDescription2,
              TextConstants.sumoSquatsDescription3,
              TextConstants.sumoSquatsDescription4,
              TextConstants.sumoSquatsDescription5,
              TextConstants.sumoSquatsDescription6
            ],
            ),
            ExerciseData(
            description: TextConstants.jumpingSquatsDescription, 
            image: '', 
            minutes: TextConstants.jumpingSquatsMin, 
            progress: 0, 
            title: TextConstants.jumpingSquats, 
            video: PathConstatnts.jumpingSquats, 
            steps: [
              TextConstants.jumpingSquatsDescription1,
              TextConstants.jumpingSquatsDescription2,
              TextConstants.jumpingSquatsDescription3,
              TextConstants.jumpingSquatsDescription4,
              TextConstants.jumpingSquatsDescription5,
              TextConstants.jumpingSquatsDescription6
            ],
            ),

        ], 
        image: '', 
        minutes: TextConstants.bootyMinutes, 
        progress: 0, 
        title: TextConstants.booty,
        ),
  ];
  static List<String> reminderDays = [
    TextConstants.everyday,
    TextConstants.monday_friday,
    TextConstants.weekends,
    TextConstants.monday,
    TextConstants.tuesday,
    TextConstants.wednesday,
    TextConstants.thursday,
    TextConstants.friday,
    TextConstants.saturday,
    TextConstants.sunday,
  ];
}

import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/screens/onboarding/bloc/onboarding_bloc.dart';
import 'package:flex_ui/screens/onboarding/widget/onboarding_tile.dart';

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
}

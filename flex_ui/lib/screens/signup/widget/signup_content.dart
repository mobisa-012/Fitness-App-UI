import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/core/services/validation_service.dart';
import 'package:flex_ui/screens/signup/bloc/signup_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common_widgets/fitness_button.dart';
import '../../common_widgets/fitness_loading.dart';
import '../../common_widgets/fitness_text_field.dart';

class SignUpContent extends StatelessWidget {
  const SignUpContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            _createMainData(context),
            BlocBuilder<SignUpBloc, SignUpState>(
              buildWhen: (_, currState) =>
                  currState is LoadingState ||
                  currState is NextTabBarPageState ||
                  currState is ErrorState,
              builder: (context, state) {
                if (state is LoadingState) {
                  return _createLoading();
                } else if (state is NextTabBarPageState ||
                    state is ErrorState) {
                  return const SizedBox();
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _createMainData(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _createTitle(context),
            const SizedBox(
              height: 50,
            ),
            _createForm(context),
            const SizedBox(
              height: 40,
            ),
            _createSignUpButton(context),
            const SizedBox(
              height: 40,
            ),
            _createHaveAccountText(context),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget _createLoading() {
    return const FitnessLoading();
  }

  Widget _createTitle(BuildContext context) {
    return const Text(TextConstants.signUp,
        style: TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold));
  }

  Widget _createForm(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (_, currState) => currState is ShowErrorState,
      builder: (context, state) {
        return Column(
          children: [
            FitnessTextField(
              title: TextConstants.username,
              placeholder: TextConstants.userNamePlaceholder,
              controller: bloc.userNameController,
              textInputAction: TextInputAction.next,
              errorText: TextConstants.userNameErrorText,
              isError: state is ShowErrorState
                  ? !ValidationService.username(bloc.userNameController.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: TextConstants.email,
              placeholder: TextConstants.emailPlaceholder,
              textInputAction: TextInputAction.next,
              errorText: TextConstants.emailErrorText,
              keyboardType: TextInputType.emailAddress,
              controller: bloc.emailController,
              isError: state is ShowErrorState
                  ? !ValidationService.email(bloc.emailController.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: TextConstants.password,
              placeholder: TextConstants.passwordPlaceholder,
              errorText: TextConstants.passwordPlaceholder,
              controller: bloc.passwordController,
              textInputAction: TextInputAction.next,
              isError: state is ShowErrorState
                  ? !ValidationService.password(bloc.passwordController.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEvent());
              },
            ),
            const SizedBox(height: 20),
            FitnessTextField(
              title: TextConstants.confirmPassword,
              placeholder: TextConstants.confirmpasswordPlaceholder,
              errorText: TextConstants.confirmpasswordErrorText,
              controller: bloc.confirmPasswordController,
              textInputAction: TextInputAction.next,
              isError: state is ShowErrorState
                  ? !ValidationService.confirmPassword(
                      bloc.passwordController.text,
                      bloc.confirmPasswordController.text)
                  : false,
              onTextChanged: () {
                bloc.add(OnTextChangedEvent());
              },
            )
          ],
        );
      },
    );
  }

  Widget _createSignUpButton(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (_, currState) => currState is SignUpButtonEnabledState,
        builder: (context, state) {
          return FitnessButton(
            title: TextConstants.signUp,
            isEnabled:
                state is SignUpButtonEnabledState ? state.isEnabled : false,
            onTap: () {
              FocusScope.of(context).unfocus();
              bloc.add(SignUpTappedEvent());
            },
          );
        },
      ),
    );
  }

  Widget _createHaveAccountText(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);
    return RichText(
      text: TextSpan(
          text: TextConstants.alreadyHaveAnAccount,
          style: const TextStyle(
            color: AppColors.categoriesWorkoutsTextColor,
            fontSize: 18,
          ),
          children: [
            TextSpan(
                text: TextConstants.signIn,
                style: const TextStyle(
                  color: AppColors.weightLossContainerColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    bloc.add(SignInTappedEvent());
                  }),
          ]),
    );
  }
}

import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/core/services/validation_service.dart';
import 'package:flex_ui/screens/common_widgets/fitness_button.dart';
import 'package:flex_ui/screens/common_widgets/fitness_loading.dart';
import 'package:flex_ui/screens/common_widgets/fitness_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sign_in_bloc.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          _createMainData(context),
          BlocBuilder<SignInBloc, SignInState>(
            buildWhen: (_, currState) =>
                currState is LoadingState ||
                currState is SignInErrorState ||
                currState is NextTabBarPageState,
            builder: (context, state) {
              if (state is LoadingState) {
                return _createLoading();
              } else if (state is SignInErrorState ||
                  state is NextTabBarPageState) {
                return const SizedBox();
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _createMainData(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: height - 30 - MediaQuery.of(context).padding.bottom,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            _createHeader(),
            const SizedBox(height: 50),
            _createForm(context),
            const SizedBox(
              height: 20,
            ),
            _createForgotPasswordButton(context),
            const SizedBox(height: 40),
            _createSignInButton(context),
            const Spacer(),
            _createDoNotHaveAccountText(context),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }

  Widget _createLoading() {
    return const FitnessLoading();
  }

  Widget _createHeader() {
    return const Center(
      child: Text(
        TextConstants.signIn,
        style: TextStyle(
            color: AppColors.loadingBlack,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final bloc = BlocProvider.of<SignInBloc>(context);
    return BlocBuilder(
      buildWhen: (_, currState) => currState is ShowErrorState,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FitnessTextField(
                tile: TextConstants.email,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                placeholder: TextConstants.emailPlaceholder,
                errorText: TextConstants.emailErrorText,
                controller: bloc.emailController,
                isError: state is ShowErrorState
                    ? !ValidationService.email(bloc.emailController.text)
                    : false,
                onTextChanged: () {
                  bloc.add(OnTextChangedEvent());
                }),
            const SizedBox(
              height: 20,
            ),
            FitnessTextField(
                tile: TextConstants.password,
                placeholder: TextConstants.passwordPlaceholder,
                obscureText: true,
                isError: state is ShowErrorState
                    ? !ValidationService.password(bloc.passwordController.text)
                    : false,
                errorText: TextConstants.passwordErrorText,
                controller: bloc.passwordController,
                onTextChanged: () {
                  bloc.add(OnTextChangedEvent());
                })
          ],
        );
      },
    );
  }

  Widget _createForgotPasswordButton(BuildContext context) {
    final bloc = BlocProvider.of<SignInBloc>(context);
    return GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(left: 21),
        child: Text(
          TextConstants.forgotPassword,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.weightLossContainerColor),
        ),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
        bloc.add(ForgotPasswordTappedEvent());
      },
    );
  }

  Widget _createSignInButton(BuildContext context) {
    final bloc = BlocProvider.of<SignInBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder(
          buildWhen: (_, currState) =>
              currState is SignInButtonEnabledChangedState,
          builder: (context, state) {
            return FitnessButton(
              title: TextConstants.signIn,
              isEnabled: state is SignInButtonEnabledChangedState
                  ? state.isEnabled
                  : false,
              onTap: () {
                FocusScope.of(context).unfocus();
                bloc.add(SignInTappedEvent());
              },
            );
          }),
    );
  }

  Widget _createDoNotHaveAccountText(BuildContext context) {
    final bloc = BlocProvider.of<SignInBloc>(context);
    return Center(
      child: RichText(
        text: TextSpan(
            text: TextConstants.doNotHaveAnAcount,
            style: const TextStyle(
              color: AppColors.loadingBlack, 
              fontSize: 18),
            children: [
              TextSpan(
                  text: TextConstants.signUp,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.loadingBlack),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      bloc.add(SignUpTappedEvent());
                    })
            ]),
      ),
    );
  }
}

import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/core/services/validation_service.dart';
import 'package:flex_ui/screens/common_widgets/fitness_button.dart';
import 'package:flex_ui/screens/common_widgets/fitness_loading.dart';
import 'package:flex_ui/screens/common_widgets/fitness_text_field.dart';
import 'package:flex_ui/screens/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordContent extends StatefulWidget {
  const ForgotPasswordContent({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordContent> createState() => _ForgotPasswordContentState();
}

class _ForgotPasswordContentState extends State<ForgotPasswordContent> {
  bool isButtonEnabled = false;
  bool isTextFieldError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          _createMainData(context),
          BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
            buildWhen: (_, currState) =>
                currState is ForgotPasswordLoading ||
                currState is ForgotPasswordError ||
                currState is ForgotPasswordSuccess,
            builder: (context, state) {
              if (state is ForgotPasswordLoading) {
                return _createLoading();
              } else if (state is ForgotPasswordSuccess) {
                return const SizedBox();
              } else if (state is ForgotPasswordError) {
                return const SizedBox();
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _createLoading() {
    return const FitnessLoading();
  }

  Widget _createMainData(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: height -
              30 -
              MediaQuery.of(context).padding.bottom -
              kToolbarHeight,
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              _createForm(context),
              const Spacer(
                flex: 3,
              ),
              _createResetPasswordButton(context),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createForm(BuildContext context) {
    final bloc = BlocProvider.of<ForgotPasswordBloc>(context);
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return FitnessTextField(
          title: TextConstants.email,
          keyboardType: TextInputType.emailAddress,
          placeholder: TextConstants.emailPlaceholder,
          errorText: TextConstants.emailErrorText,
          controller: bloc.emailController,
          isError: isTextFieldError,
          onTextChanged: () {
            setState(() {
              isButtonEnabled = bloc.emailController.text.isNotEmpty;
            });
          },
        );
      },
    );
  }

  Widget _createResetPasswordButton(BuildContext context) {
    final bloc = BlocProvider.of<ForgotPasswordBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        builder: (context, state) {
          return FitnessButton(
              title: TextConstants.sendActivationBuild,
              isEnabled: isButtonEnabled,
              onTap: () {
                FocusScope.of(context).unfocus();
                if (isButtonEnabled) {
                  setState(() {
                    isTextFieldError =
                        !ValidationService.email(bloc.emailController.text);
                  });
                  if (!isTextFieldError) {
                    bloc.add(ForgotPasswordTappedEvent());
                  }
                }
              });
        },
      ),
    );
  }
}

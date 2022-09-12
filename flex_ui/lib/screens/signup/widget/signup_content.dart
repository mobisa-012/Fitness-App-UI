import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/screens/signup/bloc/signup_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return FitnessLoading();
  }

  Widget _createTitle() {
    return Text(
      TextConstants.signUp,
      style: ,
    );
  }
}

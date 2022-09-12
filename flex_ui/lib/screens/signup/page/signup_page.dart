import 'package:flex_ui/screens/signup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SignUpBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listenWhen: (_, currState) =>
            currState is NextTabBarPageState ||
            currState is NextSignInPageState ||
            currState is ErrorState,
        listener: (context, state) {
          if (state is NextTabBarPageState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => TabBarPage()));
          }
          if (state is NextSignInPageState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => SignInPage()));
          }
          if (state is ErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        buildWhen: (_, currState) => currState is SignUpInitial,
        builder: (context, state) {
          return SignUpContent();
        },
      ),
    );
  }
}

import 'package:flex_ui/screens/signup/bloc/signup_bloc.dart';
import 'package:flex_ui/screens/tab_bar_page/page/tab_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/signup_content.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  BlocProvider<SignUpBloc> _buildBody(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (BuildContext context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listenWhen: (_, currState) => currState is NextTabBarPageState || currState is NextSignInPageState || currState is ErrorState,
        listener: (context, state) {
          if (state is NextTabBarPageState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const TabBarPage()));
          } else if (state is NextSignInPageState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const SignUpPage()));
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        buildWhen: (_, currState) => currState is SignUpInitial,
        builder: (context, state) {
          return  const SignUpContent();
        },
      ),
    );
  }
}
// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/core/services/auth_service.dart';
import 'package:flex_ui/screens/common_widgets/setting_container.dart';
import 'package:flex_ui/screens/edit_account_screen/page/edit_account_screen.dart';
import 'package:flex_ui/screens/profile_page/bloc/profile_page_bloc.dart';
import 'package:flex_ui/screens/reminder/page/reminder_page.dart';
import 'package:flex_ui/screens/signIn/page/sign_in_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? photoUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContext(context));
  }

  BlocProvider<ProfileBloc> _buildContext(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        buildWhen: (_, currState) => currState is ProfileInitial,
        builder: (context, state) {
          return _settingsContent(context);
        },
        listenWhen: (_, currState) => true,
        listener: (context, state) {},
      ),
    );
  }

  Widget _settingsContent(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? "No Username";
    photoUrl = user?.photoURL;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(children: [
            Stack(alignment: Alignment.topRight, children: [
              Center(
                child: photoUrl == null
                    ? const CircleAvatar(
                        backgroundImage:
                            AssetImage(PathConstatnts.profileAvatar),
                        radius: 60)
                    : CircleAvatar(
                        radius: 60,
                        child: ClipOval(
                            child: FadeInImage.assetNetwork(
                          placeholder: PathConstatnts.profileAvatar,
                          image: photoUrl!,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 120,
                        )),
                      ),
              ),
              TextButton(
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditAccountScreen()));
                    setState(() {
                      photoUrl = user?.photoURL;
                    });
                  },
                  style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor:
                          AppColors.onboardingColor.withOpacity(0.16)),
                  child: const Icon(Icons.edit, color: AppColors.onboardingColor)),
            ]),
            const SizedBox(height: 15),
            Text(displayName,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            SettingsContainer(
              withArrow: true,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const ReminderPage()));
              },
              child: const Text(TextConstants.reminder,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500)),
            ),
            if (!kIsWeb)
              SettingsContainer(
                child: Text(
                    '${TextConstants.rateUsOn}${Platform.isIOS ? 'App store' : 'Play market'}',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500)),
                onTap: () {
                  return launch(Platform.isIOS
                      ? 'https://www.apple.com/app-store/'
                      : 'https://play.google.com/store');
                },
              ),
            SettingsContainer(
                onTap: () => launch('https://perpet.io/'),
                child: const Text(TextConstants.terms,
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500))),
            SettingsContainer(
                child: const Text(TextConstants.signOut,
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500)),
                onTap: () {
                  AuthService.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInPage()),
                  );
                }),
            const SizedBox(height: 15),
            const Text(TextConstants.joinUs,
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () =>
                        launch('https://www.facebook.com/perpetio/'),
                    style: TextButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                        elevation: 1),
                    child: Image.asset(PathConstatnts.facebook)),
                TextButton(
                    onPressed: () =>
                        launch('https://www.instagram.com/perpetio/'),
                    style: TextButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                        elevation: 1),
                    child: Image.asset(PathConstatnts.facebook)),
                TextButton(
                    onPressed: () => launch('https://twitter.com/perpetio'),
                    style: TextButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                        elevation: 1),
                    child: Image.asset(PathConstatnts.twitter)),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
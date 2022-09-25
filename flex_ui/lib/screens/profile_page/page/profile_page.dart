import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/core/services/auth_service.dart';
import 'package:flex_ui/screens/common_widgets/setting_container.dart';
import 'package:flex_ui/screens/edit_account_screen/page/edit_account_screen.dart';
import 'package:flex_ui/screens/profile_page/bloc/profile_page_bloc.dart';
import 'package:flex_ui/screens/signIn/page/sign_in_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(context),
    );
  }

  Widget _buildContext(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(),
      child: BlocConsumer<ProfileBloc, ProfileState>(
          buildWhen: (_, currState) => currState is ProfileInitial,
          builder: (context, state) {
            return _profileContent(context);
          },
          listenWhen: (_, currState) => true,
          listener: (context, state) {}),
    );
  }

  Widget _profileContent(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? 'No username';
    photoUrl = user?.photoURL;

    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                child: photoUrl == null
                    ? const CircleAvatar(
                        backgroundImage: AssetImage(
                          PathConstatnts.profileAvatar,
                        ),
                        radius: 60,
                      )
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
                        AppColors.weightLossContainerColor.withOpacity(0.16)),
                child: const Icon(
                  Icons.edit,
                  color: AppColors.weightLossContainerColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                displayName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SettingsContainer(
                withArrow: true,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ReminderPage()));
                },
                child: const Text(
                  TextConstants.reminder,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              if (!kIsWeb)
                SettingsContainer(
                  child: Text(
                    '${TextConstants.rateUsOn}${Platform.isIOS ? 'App Store' : 'Play Market'}',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    // ignore: deprecated_member_use
                    return launch(Platform.isIOS
                        ? 'https://www.apple.com/app-store'
                        : 'https://play.google.com/store');
                  },
                ),
              SettingsContainer(
                // ignore: deprecated_member_use
                onTap: () => launch('https://perpet.io/'),
                child: const Text(
                  TextConstants.terms,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              SettingsContainer(
                child: const Text(
                  TextConstants.signOut,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  AuthService.signOut();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => const SignInPage()));
                },
              ),
              const SizedBox(height: 15,),
              const Text(
                TextConstants.joinUs,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    // ignore: deprecated_member_use
                    onPressed: () => launch('https://www.facebook.com/perpetio/'),
                    style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    elevation: 1), 
                    child: Image.asset(PathConstatnts.facebook),
                    ),
                    TextButton(
                    // ignore: deprecated_member_use
                    onPressed: () => launch('https://www.facebook.com/perpetio/'),
                    style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    elevation: 1), 
                    child: Image.asset(PathConstatnts.facebook),
                    ),
                    TextButton(
                    // ignore: deprecated_member_use
                    onPressed: () => launch('https://www.facebook.com/perpetio/'),
                    style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    elevation: 1), 
                    child: Image.asset(PathConstatnts.facebook),
                    )
                ],
              )
            ],
          ),
        ]),
      )),
    );
  }
}

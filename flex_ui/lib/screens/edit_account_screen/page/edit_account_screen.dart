import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/core/services/validation_service.dart';
import 'package:flex_ui/screens/change_password/page/change_password_page.dart';
import 'package:flex_ui/screens/common_widgets/fitness_button.dart';
import 'package:flex_ui/screens/common_widgets/fitness_loading.dart';
import 'package:flex_ui/screens/common_widgets/setting_container.dart';
import 'package:flex_ui/screens/common_widgets/settings_text_field.dart';
import 'package:flex_ui/screens/edit_account_screen/bloc/edit_account_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailContoller = TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser;
  String? photoUrl;
  bool isNameValid = false;
  bool isEmailValid = false;
  late String userName;
  late String userEmail;

  @override
  void initState() {
    userName = user?.displayName ?? 'No username';
    userEmail = user?.email ?? 'No email';
    photoUrl = user?.photoURL;
    nameController.text = userName;
    emailContoller.text = userEmail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildContext(context),
        appBar: AppBar(
          title: const Text(
            TextConstants.editAccount,
            style: TextStyle(
              color: AppColors.loadingBlack,
              fontSize: 17,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          iconTheme:
              const IconThemeData(color: AppColors.weightLossContainerColor),
        ));
  }

  BlocProvider<EditAccountBloc> _buildContext(BuildContext context) {
    return BlocProvider<EditAccountBloc>(
        create: (context) => EditAccountBloc(),
        child: BlocConsumer<EditAccountBloc, EditAccountState>(
          buildWhen: (_, currState) =>
              currState is EditAccountInitial ||
              currState is EditAccountProgress ||
              currState is EditAccountError ||
              currState is EditPhotoSuccess,
          builder: (context, state) {
            if (state is EditAccountProgress) {
              return Stack(
                children: [
                  _editAccountContent(context),
                  const FitnessLoading(),
                ],
              );
            }
            if (state is EditAccountError) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                _showOpenSettingPopUp();
              });
            }
            if (state is EditPhotoSuccess) photoUrl = state.image.path;
            return _editAccountContent(context);
          },
          listenWhen: (_, currState) => true,
          listener: (context, state) {},
        ));
  }

  Widget _editAccountContent(BuildContext context) {
    EditAccountBloc bloc = BlocProvider.of<EditAccountBloc>(context);
    double height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SizedBox(
            height: height - 140 - MediaQuery.of(context).padding.bottom,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: _getImageWidget(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      bloc.add(UploadImage());
                    },
                    child: const Text(
                      TextConstants.editPhoto,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.weightLossContainerColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  TextConstants.fullName,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SettingsContainer(
                  child: SettingsTextField(
                    controller: nameController,
                    placeHolder: TextConstants.fullNamePlaceholder,
                  ),
                ),
                if (isNameValid)
                  const Text(
                    TextConstants.nameShouldContain2Char,
                    style: TextStyle(color: AppColors.errorColor),
                  ),
                const Text(
                  TextConstants.email,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SettingsContainer(
                  child: SettingsTextField(
                    controller: emailContoller,
                    placeHolder: TextConstants.emailPlaceholder,
                  ),
                ),
                if (isEmailValid)
                  const Text(
                    TextConstants.emailErrorText,
                    style: TextStyle(color: AppColors.errorColor),
                  ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const ChangePasswordScreen())));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        TextConstants.changePassword,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.weightLossContainerColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.weightLossContainerColor,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                FitnessButton(
                  title: TextConstants.save,
                  isEnabled: true,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      isNameValid = !(nameController.text.length > 1);
                      isEmailValid =
                          !ValidationService.email(emailContoller.text);
                    });
                    if (!(isNameValid || isEmailValid)) {
                      if (userName != nameController.text ||
                          userEmail != emailContoller.text) {
                        bloc.add(ChangeUserData(
                            displayName: nameController.text,
                            email: emailContoller.text));
                        userName = nameController.text;
                        userEmail = emailContoller.text;
                      }
                    }
                    Navigator.pop(context, true);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getImageWidget() {
    if (photoUrl != null) {
      if (photoUrl!.startsWith('https://')) {
        return CircleAvatar(
          radius: 60,
          child: ClipOval(
            child: FadeInImage.assetNetwork(
              placeholder: PathConstatnts.profileAvatar,
              image: photoUrl!,
              fit: BoxFit.cover,
              width: 200,
              height: 120,
            ),
          ),
        );
      } else {
        return CircleAvatar(
          backgroundImage: FileImage(File(photoUrl!)),
          radius: 60,
        );
      }
    } else {
      return const CircleAvatar(
        backgroundImage: AssetImage(PathConstatnts.profileAvatar),
        radius: 30,
      );
    }
  }
  void _showOpenSettingPopUp() {
    showDialog(
      context: context, 
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          TextConstants.cameraPermission
        ),
        content: const Text(
          TextConstants.cameAccess
        ),
        actions: [
          CupertinoDialogAction(child: 
          const Text(
            TextConstants.deny
          ),
          onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            onPressed: (() => openAppSettings()),
            child: const Text(TextConstants.settings),)
        ],
      ),
      );
  }
}

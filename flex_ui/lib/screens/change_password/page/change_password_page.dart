import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/text_constants.dart';
import 'package:flex_ui/core/services/validation_service.dart';
import 'package:flex_ui/screens/change_password/bloc/change_password_bloc.dart';
import 'package:flex_ui/screens/common_widgets/fitness_button.dart';
import 'package:flex_ui/screens/common_widgets/fitness_loading.dart';
import 'package:flex_ui/screens/common_widgets/setting_container.dart';
import 'package:flex_ui/screens/common_widgets/settings_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswrdController =
      TextEditingController();
  final User? user = FirebaseAuth.instance.currentUser;
  bool isNewPassworInvalis = false;
  bool isConfirmPasswordInvalid = false;
  late String userName;

  @override
  void initState() {
    userName = user?.displayName ?? 'No username';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _changePasswoedContext(context),
      appBar: AppBar(
        title: const Text(
          TextConstants.changePassword,
          style: TextStyle(
            color: AppColors.loadingBlack,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme:
            const IconThemeData(color: AppColors.weightLossContainerColor),
      ),
    );
  }

  Widget _changePasswoedContext(BuildContext context) {
    return BlocProvider<ChangePasswordBloc>(
      create: (context) => ChangePasswordBloc(),
      child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        buildWhen: (_, currState) =>
            currState is ChangePasswordInitial ||
            currState is ChangePasswordError ||
            currState is ChangePasswordProgress ||
            currState is ChangePasswordSuccess,
        builder: (context, state) {
          if (state is ChangePasswordProgress) {
            return Stack(
              children: [_editAccountContent(context), const FitnessLoading()],
            );
          }
          if (state is ChangePasswordError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            });
          }
          if (state is ChangePasswordSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                state.message,
              )));
            });
          }
          return _editAccountContent(context);
        },
        listenWhen: (_, currState) => true,
        listener: (context, state) {},
      ),
    );
  }

  Widget _editAccountContent(BuildContext context) {
    ChangePasswordBloc bloc = BlocProvider.of<ChangePasswordBloc>(context);
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SizedBox(
            height: height - 140 - MediaQuery.of(context).padding.bottom,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  TextConstants.newPassword,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SettingsContainer(
                  child: SettingsTextField(
                    controller: newPasswordController,
                    obscureText: true,
                    placeHolder: TextConstants.passwordPlaceholder,
                  ),
                ),
                if (isNewPassworInvalis)
                  const Text(
                    TextConstants.passwordErrorText,
                    style: TextStyle(color: AppColors.errorColor),
                  ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  TextConstants.confirmPassword,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SettingsContainer(
                  child: SettingsTextField(
                    controller: confirmPasswrdController,
                    obscureText: true,
                    placeHolder: TextConstants.confirmpasswordPlaceholder,
                  ),
                ),
                if (isConfirmPasswordInvalid)
                  const Text(
                    TextConstants.confirmpasswordErrorText,
                    style: TextStyle(color: AppColors.errorColor),
                  ),
                const Spacer(),
                FitnessButton(
                  title: TextConstants.save,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      isNewPassworInvalis = !ValidationService.password(
                          newPasswordController.text);
                      isConfirmPasswordInvalid = newPasswordController.text !=
                          confirmPasswrdController.text;
                    });
                    if (!(isNewPassworInvalis || isConfirmPasswordInvalid)) {
                      bloc.add(ChangePassword(
                          newPassword: newPasswordController.text));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

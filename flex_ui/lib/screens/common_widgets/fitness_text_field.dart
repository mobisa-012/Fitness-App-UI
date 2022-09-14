import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/const/pathconstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FitnessTextField extends StatefulWidget {
  final String title;
  final String placeholder;
  final String errorText;
  final bool obscureText;
  final bool isError;
  final TextEditingController controller;
  final VoidCallback onTextChanged;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;

  const FitnessTextField(
      {Key? key,
      required this.title,
      required this.placeholder,
      required this.errorText,
      this.obscureText = false,
      this.isError = false,
      required this.controller,
      required this.onTextChanged,
      this.textInputAction = TextInputAction.done,
      this.keyboardType})
      : super(key: key);

  @override
  State<FitnessTextField> createState() => _FitnessTextFieldState();
}

class _FitnessTextFieldState extends State<FitnessTextField> {
  final focusNode = FocusNode();
  bool stateObscureText = false;
  bool stateIsError = false;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(
      () {
        setState(() {
          if (focusNode.hasFocus) {
            stateIsError = false;
          }
        });
      },
    );
    stateObscureText = widget.obscureText;
    stateIsError = widget.isError;
  }

  @override
  void didUpdateWidget(covariant FitnessTextField oldwidget) {
    super.didUpdateWidget(oldwidget);

    stateObscureText = widget.obscureText;
    stateIsError = focusNode.hasFocus ? false : widget.isError;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createHeader(),
          const SizedBox(
            height: 15,
          ),
          _createTextFieldStack(),
          if (stateIsError) ...[
            _createError(),
          ]
        ],
      ),
    );
  }

  Widget _createHeader() {
    return Text(
      widget.title,
      style: TextStyle(
          color: _getUserNameColor(),
          fontSize: 14,
          fontWeight: FontWeight.w500),
    );
  }

  Color _getUserNameColor() {
    if (focusNode.hasFocus) {
      return AppColors.weightLossContainerColor;
    } else if (stateIsError) {
      return AppColors.errorColor;
    } else if (widget.controller.text.isNotEmpty) {
      return Colors.black;
    }
    return Colors.grey;
  }

  Widget _createTextFieldStack() {
    return Stack(
      children: [
        _createTextField(),
        if (widget.obscureText) ...[
          Positioned(
            right: 0,
            bottom: 0,
            child: _createShowEye(),
          ),
        ]
      ],
    );
  }

  Widget _createTextField() {
    return TextField(
      focusNode: focusNode,
      controller: widget.controller,
      obscureText: stateObscureText,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: stateIsError
                  ? AppColors.errorColor
                  : AppColors.textFieldBorder.withOpacity(0.4),
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.weightLossContainerColor,
          ),
        ),
        hintText: widget.placeholder,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        filled: true,
        fillColor: AppColors.textFieldBorder,
      ),
      onChanged: (text) {
        setState(() {
          widget.onTextChanged();
        });
      },
    );
  }

  Widget _createShowEye() {
    return GestureDetector(
      onTap: () {
        setState(() {
          stateObscureText = !stateObscureText;
        });
      },
      child: Image(
        image: const AssetImage(PathConstatnts.eye),
        color: widget.controller.text.isNotEmpty
            ? AppColors.weightLossContainerColor
            : Colors.grey,
      ),
    );
  }

  Widget _createError() {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child:  Text(
        widget.errorText,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.errorColor
      ),
      ),
    );
  }
}

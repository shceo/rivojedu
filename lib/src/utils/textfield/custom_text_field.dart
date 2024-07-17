import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldCustom extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextInputType keyBoardType;
  final TextEditingController? controller;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final FocusNode? focusNode;
  final GlobalKey<FormState> formKey;

  const TextFieldCustom({
    Key? key,
    required this.title,
    required this.isPassword,
    required this.keyBoardType,
    required this.formKey,
    this.controller,
    this.maskTextInputFormatter,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyBoardType,
      inputFormatters: maskTextInputFormatter != null ? [maskTextInputFormatter!] : [],
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: title,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}

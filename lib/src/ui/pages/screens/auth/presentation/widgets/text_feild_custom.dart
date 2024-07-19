import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'my_function.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({
    super.key,
    required this.formKey,
    required this.title,
    required this.isPassword,
    required this.keyBoardType,
    required this.maskTextInputFormatter,
    required this.focusNode,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final TextInputType keyBoardType;
  final String title;
  final bool isPassword;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final FocusNode? focusNode;
  final TextEditingController controller;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        hintText: widget.title,
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        border: InputBorder.none,
        suffixIcon: widget.isPassword == true
            ? IconButton(
          onPressed: () {
            setState(() {
              obscure = !obscure;
            });
          },
          icon: SvgPicture.asset(
            obscure ? CommonAssets.eye : CommonAssets.closedEye,
          ),
        )
            : null,
      ),
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      keyboardType: widget.keyBoardType,
      focusNode: widget.focusNode,
      obscureText: widget.isPassword ? obscure : false,
      inputFormatters: widget.maskTextInputFormatter != null
          ? [widget.maskTextInputFormatter!]
          : null,
      validator: (value) {
        if (widget.isPassword == true) {
          if (value == null || value.isEmpty || value.length < 8) {
            return 'Passwordni to\'liq kiriting';
          }
        } else {
          if (value == null || value.isEmpty) {
            return 'Raqamni kiriting';
          } else if (!MyFunctions.validatePhoneNumber(value)) {
            return 'Raqam noto\'g\'ri formatda';
          }
        }
        return null;
      },
    );
  }
}

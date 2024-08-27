import 'package:edu/assets/constants/common_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldContainer extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyBoardType;
  final String labelText;
  final Color labelTextColor;
  final Widget? suffixIcon;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final bool isObscureText;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? action;

  const TextFieldContainer({
    super.key,
    this.hintText = '',
    required this.keyBoardType,
    required this.controller,
    this.labelText = '',
    this.labelTextColor = Colors.black,
    this.suffixIcon = const SizedBox(),
    this.maskTextInputFormatter,
    this.isObscureText = false,
    this.focusNode,
    this.prefixIcon,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.validator,
    this.action,
  });

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: obscure,
      maxLines: widget.isObscureText == true ? 1 : widget.maxLines,
      obscuringCharacter: "*",
      maxLength: widget.maxLength,
      focusNode: widget.focusNode,
      inputFormatters: widget.maskTextInputFormatter != null
          ? [widget.maskTextInputFormatter!]
          : null,
      controller: widget.controller,
      decoration: InputDecoration(
        // labelText: widget.labelText,
        // labelStyle:TextStyle(color: Colors.grey.shade500, fontSize: 14) ,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isObscureText
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
            : widget.suffixIcon,
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
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
      ),
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      keyboardType: widget.keyBoardType,
      // maxLines: ,
      textAlign: TextAlign.start,
      validator: widget.validator,
      textInputAction: widget.action,
    );
  }
}

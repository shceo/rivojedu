import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final bool? showError;
  final TextEditingController? controller;
  final bool? autoFocus;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;
  final TextInputType? keyboardType;
  final String? errorText;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final Color? fillColor;
  final EdgeInsets? margin;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final int maxLines;

  const InputField({
    super.key,
    this.onSubmitted,
    this.showError = false,
    this.controller,
    this.autoFocus,
    this.onChanged,
    this.keyboardType,
    this.errorText,
    this.inputAction,
    this.focusNode,
    this.fillColor,
    this.margin,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??EdgeInsets.zero,
      child: TextField(
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        focusNode: focusNode,
        autofocus: autoFocus ?? false,
        textInputAction: inputAction,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        maxLines: maxLines,
        minLines: 1,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          hintText: hintText,
          fillColor: fillColor ?? Colors.red,
          filled: true,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: Colors.black,
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: onSuffixTap,
                  icon: Icon(
                    suffixIcon,
                    color: Colors.blue,
                  ),
                )
              : null,
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.black,
            ),
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          errorText: showError ?? false ? errorText : null,
        ),
        cursorColor: Colors.white
      ),
    );
  }
}

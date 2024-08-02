import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import '../../../../theme/app_themes.dart';

class LessonsTextField extends StatelessWidget {
  const LessonsTextField({
    super.key,
    required this.controller,
    this.function,
  });

  final TextEditingController controller;
  final Function(String)? function;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            color: blackDark.withOpacity(.2),
          ),
        ],
        color: white,
      ),
      height: 33.h,
      width: 194.w,
      child: TextField(
        controller: controller,
        onChanged: function,
        decoration: InputDecoration(
          hintText: "Xabar",
          hintStyle: TextStyle(
            fontSize: 12.w,
            color: blackDark.withOpacity(.2),
          ),
          fillColor: Colors.transparent,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

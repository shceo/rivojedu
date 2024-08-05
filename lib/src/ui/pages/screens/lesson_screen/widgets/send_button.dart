import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_themes.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          color: const Color(0xffd3d3d3),
        ),
        child: Center(
          child: Text(
            "Yuborish",
            style: TextStyle(
              fontSize: 12.w,
              color: white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

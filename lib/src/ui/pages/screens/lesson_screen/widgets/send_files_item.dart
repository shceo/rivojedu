import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';

class SendFilesItem extends StatelessWidget {
  const SendFilesItem({
    super.key,
    required this.iconPath,
    required this.text,
    required this.voidCallback,
  });

  final String iconPath;
  final String text;
  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: voidCallback,
          child: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Image.asset(
              iconPath,
              width: 30.w,
              height: 30.h,
            ),
          ),
        ),
        9.getH(),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.w,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

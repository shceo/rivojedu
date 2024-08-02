import 'package:flutter/material.dart';
import '../../../../../utils/size/size.dart';

class DialogItem extends StatelessWidget {
  const DialogItem({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 157.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.w),
          topRight: Radius.circular(20.w),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}

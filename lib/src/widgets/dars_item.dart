import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarsItem extends StatelessWidget {
  const DarsItem(
      {super.key, required this.tap, required this.onTap, required this.text});
  final bool tap;
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 7),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        decoration: BoxDecoration(
            color: tap ? blue : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: grey, width: tap ? 0 : 1)),
        child: Text(
          text,
          style: TextStyle(
              color: tap ? Colors.white : Colors.black,
              fontSize: 13.w,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

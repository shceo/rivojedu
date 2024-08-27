import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WarningItem extends StatelessWidget {
  const WarningItem({
    super.key,
    required this.imagePath,
    required this.text,
  });

  final String imagePath;
  final String text;

  get white => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: 28.h,
        horizontal: 45.w,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20.w),
        boxShadow: [
          BoxShadow(
            // color white bolganda shadow korinmayabdi!!
            // color: white.withOpacity(0.25),
            color: blackDark.withOpacity(0.25),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 70.h,
            width: 70.w,
          ),
          14.verticalSpace,
          Text(
            text,
            style: TextStyle(
              fontSize: 20.sp,
              color: blackDark,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

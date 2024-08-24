import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../theme/app_themes.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key, required this.teacherBranch, required this.teacherData});

  final String teacherBranch;
  final String teacherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 0),
            color: blackDark.withOpacity(.25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
            child: Text(
              "Introduction",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.w,
                color: c235789,
              ),
            ),
          ),
          Divider(color: EDEEF0, height: 1.h),
          5.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "O’qituvchi",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.w,
                    color: c575757,
                  ),
                ),
                10.verticalSpace,
                Text(
                  teacherBranch,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.w,
                    color: c575757,
                  ),
                ),
                15.verticalSpace,
                Text(
                  "Men haqimda",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.w,
                    color: c575757,
                  ),
                ),
                10.verticalSpace,
                Text(
                  teacherData,
                  style: TextStyle(
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                    color: c6B6B6B,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

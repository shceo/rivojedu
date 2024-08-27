import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingItem extends StatelessWidget {
  final double width;
  final int height;
  final int borderRadius;
  final int marginWidth;
  final int marginHeight;

  const LoadingItem({
    this.width = double.infinity,
    this.height = 40,
    this.borderRadius = 0,
    this.marginWidth = 0,
    this.marginHeight = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height.h,
        width: width.w,
        margin: EdgeInsets.symmetric(
          vertical: marginHeight.h,
          horizontal: marginWidth.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
    );
  }
}

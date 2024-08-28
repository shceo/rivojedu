import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu/assets/constants/common_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestStudentItem extends StatelessWidget {
  const BestStudentItem({
    super.key,
    required this.color,
    required this.icon,
    required this.name,
    required this.surName,
    required this.rank,
    required this.avatar,
  });

  final Color color;
  final String icon;
  final String name;
  final String surName;
  final String rank;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(width: 3.sp, color: color),
                  ),
                  child: avatar.isEmpty
                      ? Image.asset(
                    CommonAssets.avatar,
                    width: 65.w,
                    fit: BoxFit.cover,
                  )
                      : CircleAvatar(
                    radius: 30.r,
                    backgroundImage: CachedNetworkImageProvider(avatar),
                  ),
                ),
                SizedBox(
                  width: 85.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        icon,
                        width: 33.w,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            rank,
            style: TextStyle(
              color: color,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              "$name $surName",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if(name.length < 5)
            10.verticalSpace,
        ],
      ),
    );
  }
}

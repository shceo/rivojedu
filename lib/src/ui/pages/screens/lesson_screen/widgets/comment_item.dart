import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_themes.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.dateText,
    required this.name,
  });

  final String imgUrl;
  final String title;
  final String dateText;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: const Color(0xfff3f3f3),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 16.w,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 15.w,
                  backgroundImage: AssetImage(imgUrl),
                ),
              ),
              5.getW(),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: blackDark,
                  fontSize: 10.w,
                ),
              ),
            ],
          ),
          10.getH(),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.w,
              color: c575757,
              fontWeight: FontWeight.w500,
            ),
          ),
          8.getH(),
          Text(
            dateText,
            style: TextStyle(
              fontSize: 12.w,
              color: c575757,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

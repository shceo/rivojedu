import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';

import '../../../../../assets/constants/common_assets.dart';
import '../../../theme/app_themes.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.voidCallback});

  final VoidCallback voidCallback;

  //TODO Model olib kiramiz keyinchalik !!!!

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: blackDark.withOpacity(.25),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.w),
              child: Image.asset(
                CommonAssets.background,
                height: 48.h,
                width: 48.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Starry Eyes",
                  style: TextStyle(
                    fontSize: 16.w,
                    color: c191c1c,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Hey, I just reviewed your work. It’s good but I think",
                  style: TextStyle(
                    fontSize: 10.w,
                    color: blackDark,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../ui/theme/app_themes.dart';

class PasswordItem extends StatelessWidget {
  const PasswordItem({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap : onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 17),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color : c575757.withOpacity(0.5),
                width: 1
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "***********",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.w),
            ),
            SvgPicture.asset(CommonAssets.editPencil , width: 20.w,fit: BoxFit.cover)
          ],
        ),
      ),
    );
  }
}

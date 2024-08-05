import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import '../../../../../../assets/constants/common_assets.dart';
import '../../../../theme/app_themes.dart';

class TeacherItem extends StatelessWidget {
  const TeacherItem({
    super.key,
    required this.teacherField,
    required this.experience,
    required this.teacherName,
  });

  final String teacherField;
  final String experience;
  final String teacherName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 33.w,
          backgroundImage: const AssetImage(CommonAssets.profile),
        ),
        12.getW(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teacherName,
              style: TextStyle(
                fontSize: 15.w,
                fontWeight: FontWeight.w700,
                color: blackDark,
              ),
            ),
            5.getH(),
            Text(
              teacherField,
              style: TextStyle(
                fontSize: 12.w,
                fontWeight: FontWeight.w700,
                color: c575757,
              ),
            ),
            5.getH(),
            Text(
              experience,
              style: TextStyle(
                fontSize: 12.w,
                fontWeight: FontWeight.w700,
                color: c575757,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

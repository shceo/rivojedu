import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:edu/src/widgets/best_student_item.dart';
import 'package:edu/src/widgets/student_item.dart';
import 'package:edu/src/widgets/swipper_item.dart';
import 'package:flutter/material.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  int selectedLesson = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            CommonAssets.background,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: ListView(
              children: [
               
                Text(
                  "Darslar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.w,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const StudentItem(),
                SizedBox(height: 26.h),
                Text(
                  "Best Students",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.w,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 13),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BestStudentItem(
                      color: Color(0xFFFFD700),
                      icon: CommonAssets.medal1,
                    ),
                    BestStudentItem(
                      color: Color(0xFFC0C0C0),
                      icon: CommonAssets.medal2,
                    ),
                    BestStudentItem(
                      color: Color(0xFFCD7F32),
                      icon: CommonAssets.medal3,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const SwipperItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

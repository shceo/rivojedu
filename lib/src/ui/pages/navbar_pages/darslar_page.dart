import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/domain/blocs/top_users_bloc/top_users_bloc.dart';
import 'package:edu/src/widgets/best_student_item.dart';
import 'package:edu/src/widgets/student_item.dart';
import 'package:edu/src/widgets/swipper_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "Best Students",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.w,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                13.verticalSpace,
                BlocBuilder<TopUsersBloc, TopUsersState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BestStudentItem(
                          color: const Color(0xFFFFD700),
                          icon: CommonAssets.medal1,
                          name: state.topUsers[0].name,
                          surName: state.topUsers[0].surName,
                          rank: state.topUsers[0].percentage.toString(),
                          avatar: state.topUsers[0].avatar,
                        ),
                        BestStudentItem(
                          color: const Color(0xFFC0C0C0),
                          icon: CommonAssets.medal2,
                          name: state.topUsers[1].name,
                          surName: state.topUsers[1].surName,
                          rank: state.topUsers[1].percentage.toString(),
                          avatar: state.topUsers[1].avatar,
                        ),
                        BestStudentItem(
                          color: const Color(0xFFCD7F32),
                          icon: CommonAssets.medal3,
                          name: state.topUsers[2].name,
                          surName: state.topUsers[2].surName,
                          rank: state.topUsers[2].percentage.toString(),
                          avatar: state.topUsers[2].avatar,
                        ),
                      ],
                    );
                  },
                ),
                10.verticalSpace,
                const SwipperItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/domain/blocs/top_users_bloc/top_users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopUsersBloc, TopUsersState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 45.h, left: 10.w, right: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(CommonAssets.coin, width: 30, fit: BoxFit.cover),
                  Text(
                    state.topUsers[0].percentage.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  30.horizontalSpace,
                  Text(
                    state.topUsers[0].percentage.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Image.asset(
                    CommonAssets.star,
                    width: 30.r,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(width: 2, color: Colors.white)),
                  child: state.topUsers[0].avatar.isEmpty
                      ? Image.asset(CommonAssets.avatar,
                          width: 75.sp, fit: BoxFit.cover)
                      : CircleAvatar(
                          radius: 35.r,
                          backgroundImage: CachedNetworkImageProvider(
                            state.topUsers[0].avatar,
                          ),
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

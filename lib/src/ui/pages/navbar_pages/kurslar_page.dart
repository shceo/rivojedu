import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/domain/blocs/user_bloc/user_bloc.dart';
import 'package:edu/src/ui/pages/screens/notification_screen.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/widgets/moduls-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(CommonAssets.background,
              width: double.infinity, fit: BoxFit.cover),
          Positioned(
            top: 40.h,
            left: 21.w,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Row(
                  children: [
                    state.userModel.avatar.isNotEmpty
                        ? CircleAvatar(
                            radius: 30.r,
                            backgroundImage: CachedNetworkImageProvider(
                                state.userModel.avatar),
                          )
                        : Icon(
                            CupertinoIcons.person_alt_circle,
                            size: 40.sp,
                            color: grey,
                          ),
                    5.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Xush kelibsiz,",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: white),
                        ),
                        Text(
                          "${state.userModel.name} ${state.userModel.surname}.",
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Positioned(
              top: 50.h,
              right: 30.w,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoDialogRoute(
                            builder: (context) => const NotificationScreen(),
                            context: context));
                  },
                  child: Image.asset(CommonAssets.notification,
                      width: 30, fit: BoxFit.cover))),
          Padding(
            padding: const EdgeInsets.all(21),
            child: ListView(
              children: [
                SizedBox(
                  height: 42.h,
                ),
                const ModulsItem(),
                Container(
                  padding: EdgeInsets.all(5.w),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 50.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 22.w),
                        child: Text(
                          "Progress",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.w,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              ...List.generate(
                                6,
                                (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Text(
                                      "${100 - (index * 10)} %",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.w),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                          Image.asset(
                            CommonAssets.graph,
                            width: 270.w,
                            height: 300.h,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...List.generate(
                            12,
                            (index) {
                              return Text(
                                "L.${index + 1}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.w,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

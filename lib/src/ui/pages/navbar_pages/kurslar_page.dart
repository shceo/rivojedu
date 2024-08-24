import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/domain/entity/storage_repository.dart';
import 'package:edu/src/ui/pages/screens/notification_screen.dart';
import 'package:edu/src/widgets/moduls-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  Future<String> _getUserName() async {
    String? userName = await StorageRepository.getString(key: 'user_name');
    if (userName.isEmpty) {
      throw Exception("User name not found");
    }
    return userName;
  }

  Future<String> _getUserAvatar() async {
    String? avatarUrl = await StorageRepository.getString(key: 'avatar');
    if (avatarUrl.isEmpty) {
      throw Exception("Avatar not found");
    }
    return avatarUrl;
  }

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FutureBuilder<String>(
                      future: _getUserAvatar(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error, color: Colors.red);
                        } else {
                          String avatarUrl = snapshot.data!;
                          return CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(avatarUrl),
                          );
                        }
                      },
                    ),
                    FutureBuilder<String>(
                      future: _getUserName(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(
                            "Error: ${snapshot.error}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.w,
                                fontWeight: FontWeight.w400),
                          );
                        } else {
                          String userName = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome,",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.w,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                userName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.w,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoDialogRoute(
                              builder: (context) => const NotificationScreen(),
                              context: context));
                    },
                    child: Image.asset(CommonAssets.notification,
                        width: 30, fit: BoxFit.cover))
              ],
            ),
          ),
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

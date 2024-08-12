import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/screens/notification_screen.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:edu/src/widgets/moduls-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(CommonAssets.background,
              width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(21),
            child: ListView(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(CommonAssets.profile,
                            width: 60, height: 60, fit: BoxFit.cover),
                        const SizedBox(
                          width: 7,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Xush kelibsiz,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.w,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Ali Ergashev",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.w,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoDialogRoute(
                                  builder: (context) =>
                                      const NotificationScreen(),
                                  context: context));
                        },
                        child: Image.asset(CommonAssets.notification,
                            width: 30, fit: BoxFit.cover))
                  ],
                ),
                SizedBox(
                  height: 42.h,
                ),
                const ModulsItem(),
                const Spacer(),
                Container(
                  padding: EdgeInsets.all(5.w),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 100.h),
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
                            vertical: 28.h, horizontal: 22.w),
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
                          Image.asset(CommonAssets.graph , width: 300.w , height : 300.h,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 30.w,),
                          ...List.generate(12, (index){
                            return Padding(
                              padding: EdgeInsets.only(
                                right: 10.w
                              ),
                              child : Text("L.${index + 1}" , style: TextStyle(
                                color: Colors.black,
                                fontSize: 10.w,
                                fontWeight: FontWeight.w500
                              ),)
                            );
                          })
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

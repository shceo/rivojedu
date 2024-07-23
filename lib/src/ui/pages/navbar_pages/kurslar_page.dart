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
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
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
                const ModulsItem()
              ],
            ),
          )
        ],
      ),
    );
  }
}

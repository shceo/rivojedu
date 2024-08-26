import 'package:edu/src/domain/blocs/all_lessons_bloc/all_lessons_bloc.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/lesson_screen.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class LessonsItem extends StatelessWidget {
  const LessonsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllLessonsBloc, AllLessonsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SizedBox(
          height: 170.h,
          child: Swiper(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                  border: Border.all(
                    width: 1.w,
                    color: grey,
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const LessonScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Rasmlarni qayta ishlash...",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Text(
                              "80",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding: const EdgeInsets.all(1),
                              width: 220,
                              height: 27,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 160,
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 18.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dars 2.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.w,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Done",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.w,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 3,
            viewportFraction: 0.8,
            scale: 0.9,
            pagination: null,
            control: null,
          ),
        );
      },
    );
  }
}

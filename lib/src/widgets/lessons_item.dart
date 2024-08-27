import 'package:edu/src/domain/blocs/all_lessons_bloc/all_lessons_bloc.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/lesson_screen.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class LessonsItem extends StatelessWidget {
  const LessonsItem({super.key, required this.id, required this.valueChanged, required this.swiperControl});

  final int id;
  final ValueChanged<int> valueChanged;
  final SwiperController swiperControl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllLessonsBloc, AllLessonsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: 170.h,
          child: Swiper(
            controller: swiperControl,
            loop: false,
            onIndexChanged: (v) {
              valueChanged.call(v);
            },
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
                              return LessonScreen(lessonsName: state.lessons[index].title);
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            topRight: Radius.circular(20.r),
                          ),
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                state.lessons[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              state.lessons[index].number.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            10.verticalSpace,
                            Container(
                              padding: EdgeInsets.all(1.sp),
                              width: 220.w,
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 160.w,
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(20.r),
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
                      EdgeInsets.symmetric(vertical: 1.h, horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dars ${id + 1}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.w,
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
            itemCount: state.lessons.length,
            viewportFraction: 0.8.sp,
            scale: 0.9.sp,
            pagination: null,
            control: null,
          ),
        );
      },
    );
  }
}

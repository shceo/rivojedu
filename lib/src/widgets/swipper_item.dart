import 'package:edu/src/domain/blocs/all_lessons_bloc/all_lessons_bloc.dart';
import 'package:edu/src/domain/blocs/all_modules_bloc/all_modules_bloc.dart';
import 'package:edu/src/domain/models/form_status.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/widgets/dars_item.dart';
import 'package:edu/src/widgets/lessons_item.dart';
import 'package:edu/src/widgets/loading_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SwipperItem extends StatefulWidget {
  const SwipperItem({super.key});

  @override
  State<SwipperItem> createState() => _SwipperItemState();
}

class _SwipperItemState extends State<SwipperItem> {
  int selectedLesson = 0;
  int selectedModul = 0;
  final SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllModulesBloc, AllModulesState>(
      builder: (context, allModulesState) {
        return BlocBuilder<AllLessonsBloc, AllLessonsState>(
          builder: (context, allLessonsState) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Modul ${allModulesState.allModules[selectedModul].moduleNumber}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.w,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  5.verticalSpace,
                  if (allLessonsState.status == FormStatus.loading)
                    20.verticalSpace,
                  if (allLessonsState.status != FormStatus.error &&
                      allLessonsState.status != FormStatus.loading)
                    SizedBox(
                      height: 20.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return DarsItem(
                            tap: selectedLesson == index,
                            onTap: () {
                              setState(() {
                                selectedLesson = index;
                                swiperController.move(index);
                              });
                            },
                            text: "Dars ${index + 1}",
                          );
                        },
                        separatorBuilder: (context, index) {
                          return 8.horizontalSpace;
                        },
                        itemCount: allLessonsState.lessons.length,
                      ),
                    ),
                  10.verticalSpace,
                  allLessonsState.status == FormStatus.loading
                      ? SizedBox(
                          height: 170.h,
                          child: Swiper(
                              itemBuilder: (context, index) {
                                return const LoadingItem(
                                  height: 170,
                                  borderRadius: 20,
                                  marginWidth: 5,
                                );
                              },
                              itemCount: 2),
                        )
                      : allLessonsState.status == FormStatus.error
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 55.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.warning,
                                        color: red, size: 40.sp),
                                    10.verticalSpace,
                                    Text(
                                      allLessonsState.errorMessage,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 22.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : LessonsItem(
                              id: selectedLesson,
                              valueChanged: (int value) {
                                setState(() {
                                  selectedLesson = value;
                                });
                              },
                              swiperControl: swiperController,
                            ),
                  20.verticalSpace,
                  SizedBox(
                    height: 20.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DarsItem(
                          tap: selectedModul == index,
                          onTap: selectedModul == index
                              ? null
                              : () {
                                  setState(() {
                                    selectedModul = index;
                                    selectedLesson = 0;
                                  });
                                  context.read<AllLessonsBloc>().add(
                                        GetModuleLessonsEvent(
                                            moduleId: allModulesState
                                                .allModules[index].moduleId),
                                      );
                                },
                          text:
                              "Modul ${allModulesState.allModules[index].moduleNumber}",
                        );
                      },
                      separatorBuilder: (context, index) {
                        return 8.horizontalSpace;
                      },
                      itemCount: allModulesState.allModules.length,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

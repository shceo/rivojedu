import 'package:edu/src/domain/blocs/all_lessons_bloc/all_lessons_bloc.dart';
import 'package:edu/src/domain/blocs/all_modules_bloc/all_modules_bloc.dart';
import 'package:edu/src/widgets/dars_item.dart';
import 'package:edu/src/widgets/lessons_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwipperItem extends StatefulWidget {
  const SwipperItem({super.key});

  @override
  State<SwipperItem> createState() => _SwipperItemState();
}

class _SwipperItemState extends State<SwipperItem> {
  int selectedLesson = 0;
  int selectedModul = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllModulesBloc, AllModulesState>(
      builder: (context, state) {
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
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Modul ${state.allModules[selectedModul].moduleNumber}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.w,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 5.h),
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
                        });
                      },
                      text: "Dars ${index + 1}",
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 8.horizontalSpace;
                  },
                  itemCount: state.allModules.length,
                ),
              ),
              10.verticalSpace,
              const LessonsItem(),
              20.verticalSpace,
              SizedBox(
                height: 20.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return DarsItem(
                      tap: selectedModul == index,
                      onTap: () {
                        setState(() {
                          selectedModul = index;
                        });
                        context.read<AllLessonsBloc>().add(
                          GetModuleLessonsEvent(
                              moduleId: state.allModules[index].moduleId),
                        );
                      },
                      text: "Modul ${state.allModules[index].moduleNumber}",
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 8.horizontalSpace;
                  },
                  itemCount: state.allModules.length,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

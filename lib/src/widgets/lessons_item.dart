import 'package:cached_network_image/cached_network_image.dart';
import 'package:edu/src/domain/blocs/all_lessons_bloc/all_lessons_bloc.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/lesson_screen.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/widgets/loading_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class LessonsItem extends StatelessWidget {
  const LessonsItem(
      {super.key,
        required this.id,
        required this.valueChanged,
        required this.swiperControl});

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
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: CachedNetworkImage(
                        imageUrl: state.lessons[index].cover,
                        height: 300.h,
                        fit: BoxFit.cover,
                        placeholder: (v,i){
                          return const LoadingItem(
                            height: 30,
                            width: double.infinity,
                            borderRadius: 20,
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: state.lessons[index].source.isEmpty
                              ? null
                              : () {
                            Navigator.of(context, rootNavigator: true)
                                .push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return LessonScreen(
                                    lessonsName:
                                    state.lessons[index].title,
                                    logo: state.lessons[index].cover,
                                    videoPath:
                                    state.lessons[index].source,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.r),
                            decoration: BoxDecoration(
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
                                state.lessons[index].source.isNotEmpty
                                    ? 30.verticalSpace
                                    : 5.verticalSpace,
                                state.lessons[index].source.isNotEmpty
                                    ? Container(
                                  padding: EdgeInsets.all(1.sp),
                                  width: 220.w,
                                  height: 27.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(20.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 160.w,
                                        decoration: BoxDecoration(
                                          color: blue,
                                          borderRadius:
                                          BorderRadius.circular(20.r),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                    : Center(
                                  child: Icon(
                                    Icons.lock,
                                    color: red,
                                    size: 50.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 15.w),
                          child: Text(
                            state.lessons[index].description,
                            style: TextStyle(
                              color: white,
                              fontSize: 13.w,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        10.verticalSpace
                      ],
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

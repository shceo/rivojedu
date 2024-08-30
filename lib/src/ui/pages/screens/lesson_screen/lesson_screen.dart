import 'dart:async';

import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/generated/assets.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/comment_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/dialog_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/lessons_text_field.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/next_button_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/profile_field_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/send_button.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/send_files_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/teacher_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({
    super.key,
    required this.lessonsName,
    required this.logo,
    required this.videoPath,
  });

  final String lessonsName;
  final String logo;
  final String videoPath;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  bool nextItem = false;
  final TextEditingController controller = TextEditingController();
  bool isFullScreen = false;
  Timer? _hideTimer;

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      excludeFromSemantics: true,
      onPanDown: (v) {
        if (!isFullScreen) {
          startHideTimer(
            callback: () {
              setState(() {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
              });
            },
            timer: _hideTimer,
          );
        }else{
          setState(() {
            isFullScreen = false;
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          });
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            VideoPlayerItem(
              videoPath: widget.videoPath,
              videoChanged: (bool value) {
                setState(() {
                  isFullScreen = value;
                });
              },
            ),
            if (!isFullScreen) ...[
              Expanded(
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  children: [
                    const TeacherItem(
                      teacherField: "SMM o’qituvchisi",
                      experience: "4 yillik tajribaga ega o’qituvchi",
                      teacherName: "Josie",
                    ),
                    const SizedBox(height: 23),
                    ProfileFieldItem(
                      themeText: widget.lessonsName,
                      continueText: '23 : 30',
                      url: 'daturlash.uz',
                    ),
                    const SizedBox(height: 21),
                    GestureDetector(
                      onTap: () {
                        nextItem = !nextItem;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: const Offset(0, 0),
                              color: Colors.black.withOpacity(.25),
                            ),
                          ],
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "56 Sharhlar",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF235789),
                              ),
                            ),
                            const SizedBox(height: 4),
                            ...List.generate(
                              nextItem == false ? 3 : 7,
                              (index) => const CommentItem(
                                imgUrl: CommonAssets.profile,
                                title:
                                    "She is so nice and also very beautiful, and I think I’ll make a huge improvement through her help",
                                dateText: "21 May 2022",
                                name: "Thao Nguyen",
                              ),
                            ),
                            const SizedBox(height: 6),
                            nextItem == false
                                ? NextButtonItem(
                                    voidCallback: () {
                                      nextItem = !nextItem;
                                      setState(() {});
                                    },
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    73.verticalSpace,
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 50.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black.withOpacity(.25),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            CommonAssets.homework,
                            height: 150.h,
                          ),
                          27.verticalSpace,
                          Text(
                            "Uyga vazifa hali tayyorlanmadi",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black.withOpacity(.25),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return DialogItem(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SendFilesItem(
                                    iconPath: CommonAssets.plays,
                                    text: "Video",
                                    voidCallback: () {},
                                  ),
                                  SendFilesItem(
                                    iconPath: Assets.vectorsImg,
                                    text: "Rasm",
                                    voidCallback: () {},
                                  ),
                                  SendFilesItem(
                                    iconPath: CommonAssets.files,
                                    text: "File",
                                    voidCallback: () {},
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: SvgPicture.asset(
                        Assets.vectorsSkalpelIcon,
                        height: 20.h,
                      ),
                    ),
                    LessonsTextField(controller: controller, function: (v) {}),
                    SendButton(callback: () {}),
                  ],
                ),
              ),
              10.verticalSpace,
            ]
          ],
        ),
      ),
    );
  }
}

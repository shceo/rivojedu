import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/comment_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/dialog_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/lessons_text_field.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/next_button_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/profile_field_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/send_button.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/send_files_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/teacher_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/video_item.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late VideoPlayerController _controller;
  bool isPlaying = false;
  bool nextItem = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://www.youtube.com/watch?v=foGCCkoGrBs'))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _togglePlayPause() {
    setState(() {
      if (isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.verticalSpace,
            VideoItem(
              togglePlayPause: _togglePlayPause,
              controller: _controller,
              isPlaying: isPlaying,
            ),
            38.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TeacherItem(
                    teacherField: "Smm o’qituvchisi",
                    experience: "4 yillik tajribaga ega o’qituvchi",
                    teacherName: "Josie",
                  ),
                  23.verticalSpace,
                  const ProfileFieldItem(
                    themeText:
                        'alksdnfklsadbaskvadsfasdfasdfasdfasdfasdfasdfasasdfasdfasdfasdfasdf',
                    continueText: '23 : 30',
                    url: 'daturlash.uz',
                  ),
                  21.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      nextItem = !nextItem;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                            color: blackDark.withOpacity(.25),
                          ),
                        ],
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "56 Sharhlar",
                            style: TextStyle(
                              fontSize: 12.w,
                              fontWeight: FontWeight.w700,
                              color: c235789,
                            ),
                          ),
                          4.verticalSpace,
                          ...List.generate(
                            nextItem == false ? 3 : 7,
                            (index) => const CommentItem(
                              imgUrl: CommonAssets.profile,
                              title:
                                  "She is so nice and also very beautiful, and i think I’ll will make a huge improvement through her help",
                              dateText: "21 May 2022",
                              name: "Thao Nguyen",
                            ),
                          ),
                          6.verticalSpace,
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
                  74.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 50.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: blackDark.withOpacity(.25),
                        ),
                      ],
                      color: white,
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
                            fontSize: 20.w,
                            color: blackDark,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  100.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: blackDark.withOpacity(.25),
            ),
          ],
          color: white,
        ),
        height: 58.h,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            24.horizontalSpace,
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return DialogItem(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SendFilesItem(
                            iconPath: CommonAssets.plays,
                            text: "Video",
                            voidCallback: () {},
                          ),
                          SendFilesItem(
                            iconPath: CommonAssets.images,
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
                CommonAssets.skalpel,
                height: 20.h,
              ),
            ),
            8.horizontalSpace,
            LessonsTextField(controller: controller, function: (v) {}),
            18.horizontalSpace,
            SendButton(callback: () {}),
          ],
        ),
      ),
    );
  }
}

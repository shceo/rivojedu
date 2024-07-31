import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/comment_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/next_button_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/profile_field_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/teacher_item.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/video_item.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late VideoPlayerController _controller;
  bool isPlaying = true;
  bool nextItem = false;

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
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.getH(),
            VideoItem(
              togglePlayPause: _togglePlayPause,
              controller: _controller,
              isPlaying: isPlaying,
            ),
            38.getH(),
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
                  23.getH(),
                  const ProfileFieldItem(
                    themeText:
                        'alksdnfklsadbaskvadsfasdfasdfasdfasdfasdfasdfasasdfasdfasdfasdfasdf',
                    continueText: '23 : 30',
                    url: 'daturlash.uz',
                  ),
                  21.getH(),
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
                      width: width,
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
                          4.getH(),
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
                          6.getH(),
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
                  74.getH(),
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
                        27.getH(),
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
                  100.getH(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

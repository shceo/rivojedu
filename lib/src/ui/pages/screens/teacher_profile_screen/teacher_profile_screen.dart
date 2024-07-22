import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/screens/teacher_profile_screen/widgets/profile_item.dart';
import 'package:edu/src/ui/pages/screens/teacher_profile_screen/widgets/teacher_data_item.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.getH(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: c0340F0.withOpacity(.5),
                  ),
                  child:
                      Center(child: SvgPicture.asset(CommonAssets.arrowBack)),
                ),
              ),
              const TeacherDataItem(
                imageUrl: "https://static.vecteezy.com/system/resources/thumbnails/041/642/170/small_2x/ai-generated-portrait-of-handsome-smiling-young-man-with-folded-arms-isolated-free-png.png",
                name: "Aziz Eshpolatov",
              ),
              30.getH(),
               const ProfileItem(
                teacherBranch: "Flutter dev",
                teacherData:
                    "I am young and creative. I love to paint and be outdoors in the mountains, in my free time I read, paint, practices yoga and work as a waitress. I love connecting with other people and helping othes whenever the opportunity arrises...",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

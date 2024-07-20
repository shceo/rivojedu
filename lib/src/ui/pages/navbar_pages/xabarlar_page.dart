import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/screens/personal_message_screen.dart';
import 'package:edu/src/ui/pages/navbar_pages/widgets/message_item.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(CommonAssets.background,
              width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(21),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(CommonAssets.arrowBack),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Tutors",
                      style: TextStyle(fontSize: 25.w, color: white),
                    ),
                    SizedBox(width: 16.w),
                  ],
                ),
                SizedBox(height: 39.h),
                ...List.generate(
                  5,
                  (index) => MessageItem(
                    voidCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PersonalMessage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

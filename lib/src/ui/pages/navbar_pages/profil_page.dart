import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            children: [
              60.getH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    CommonAssets.rivojLogo,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Profil",
                    style: TextStyle(
                      color: blue,
                      fontSize: 20.w,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 64.w)
                ],
              ),
              24.getH(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.w,
                    backgroundImage: const AssetImage(CommonAssets.profile),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

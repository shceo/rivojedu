import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body  : Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          children: [
            SizedBox(height: 30.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(CommonAssets.rivojLogo , width: 64 , fit : BoxFit.cover,),
                Text("Profil" , style: TextStyle(
                  color : blue,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(width: 20.w,)
              ],
            )
          ],
        ),
      )
    );
  }
}
import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:edu/src/widgets/edit_password_item.dart';
import 'package:edu/src/widgets/image_dialog.dart';
import 'package:edu/src/widgets/password_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
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
                      color: blue, fontSize: 20.w, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 60.w,
                )
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Image.asset(
                        CommonAssets.avatar,
                        width: 60.w,
                        fit: BoxFit.cover,
                      ),
                      GestureDetector(
                        onTap: (){
                          customsShowBottomSheet(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 40.w, left: 40.w),
                          child: SvgPicture.asset(
                            CommonAssets.editPen,
                            width: 20.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Abubakr Oqilov",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.w,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(
              height: 38.h,
            ),
            Text(
              "Familya",
              style: TextStyle(
                  color: c575757, fontSize: 14.w, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 6.h,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Abubakr",
                  hintStyle: const TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: c575757.withOpacity(0.5), width: 0.w)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: c575757.withOpacity(0.5), width: 1.w))),
            ),
            SizedBox(
              height: 27.h,
            ),
            Text(
              "Tug’ilgan sana",
              style: TextStyle(
                  color: c575757, fontSize: 14.w, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 6.h,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "December 27, 1990s",
                  hintStyle: const TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: c575757.withOpacity(0.5), width: 0.w)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: c575757.withOpacity(0.5), width: 1.w))),
            ),
            SizedBox(
              height: 27.h,
            ),
            Text(
              "Parol",
              style: TextStyle(
                  color: c575757, fontSize: 14.w, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 6.h,
            ),
            a == 0
                ? PasswordItem(
                    onTap: () {
                      a = 1;
                      setState(() {});
                    },
                  )
                : EditPasswordItem(onTap: () {
                    a = 0;
                    setState(() {});
                  }),
            SizedBox(
              height: 23.h,
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 17.w, horizontal: 13.h),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: c575757.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Biz haqimizda",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.w,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
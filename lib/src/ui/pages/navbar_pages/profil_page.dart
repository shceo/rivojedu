import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/domain/blocs/user_bloc/user_bloc.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/widgets/edit_password_item.dart';
import 'package:edu/src/widgets/image_dialog.dart';
import 'package:edu/src/widgets/password_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
      appBar: AppBar(
        leadingWidth: 90.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Image.asset(
            width: 64.w,
            CommonAssets.rivojLogo,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          "Profil",
          style: TextStyle(
              color: blue, fontSize: 20.w, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: ListView(
              children: [
                24.verticalSpace,
                Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          CommonAssets.avatar,
                          width: 60.w,
                          fit: BoxFit.cover,
                        ),
                        GestureDetector(
                          onTap: () {
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
                    10.horizontalSpace,
                    Text(
                      "${state.userModel.name} ${state.userModel.surname}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.w,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                38.verticalSpace,
                Text(
                  "Ism Familya",
                  style: TextStyle(
                      color: c575757,
                      fontSize: 14.w,
                      fontWeight: FontWeight.w300),
                ),
                6.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: c575757.withOpacity(0.5),
                      width: 1.w,
                    ),
                  ),
                  child: Text(
                    "${state.userModel.name} ${state.userModel.surname}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.w,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                27.verticalSpace,
                Text(
                  "Tug’ilgan sana",
                  style: TextStyle(
                      color: c575757,
                      fontSize: 14.w,
                      fontWeight: FontWeight.w300),
                ),
                6.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: c575757.withOpacity(0.5),
                      width: 1.w,
                    ),
                  ),
                  child: Text(
                    state.userModel.birthDate,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.w,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                27.verticalSpace,
                Text(
                  "Parol",
                  style: TextStyle(
                      color: c575757,
                      fontSize: 14.w,
                      fontWeight: FontWeight.w300),
                ),
                6.verticalSpace,
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
                23.verticalSpace,
                GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse('https://rivojuz.uz'));
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 17.w, horizontal: 13.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.w,
                        color: c575757.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "Biz haqimizda",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.w,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

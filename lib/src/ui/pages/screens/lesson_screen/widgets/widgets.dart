import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/screens/auth/widgets/w_textfield.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class Appbar extends StatelessWidget implements PreferredSize {
  const Appbar({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: (56),
      leading: GestureDetector(
        onTap: onTap,
        child: Container(
          height: (56),
          margin: EdgeInsets.only(
            left: 20.w,
            top: 10.h,
            bottom: 10.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: blue.withOpacity(.5),
          ),
          child: Center(
            child: SvgPicture.asset(
              CommonAssets.arrowBack,
              height: 17.5.h,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  @override
  Widget get child => throw UnimplementedError();
}

class VerticalItem extends StatelessWidget {
  const VerticalItem({
    super.key,
    required this.controllerOne,
    required this.controllerTwo,
  });

  final TextEditingController controllerOne;
  final TextEditingController controllerTwo;
  final bool active = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Text(
            "Yangi parol",
            style: TextStyle(
              fontSize: 18.sp,
              color: blackDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height:(10)),
        WTextField(
          height: (60),
          hintText: "************",
          controller: controllerOne,
          hasSuffixIcon: !true,
          isObscure: true,
        ),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.only(left: 10.sp),
          child: Text(
            "Parolni tasdiqlang",
            style: TextStyle(
              fontSize: 18.sp,
              color: blackDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        10.verticalSpace,
        WTextField(
          height: (60),
          hintText: "************",
          controller: controllerTwo,
          hasSuffixIcon: !true,
          isObscure: active,
        ),
      ],
    );
  }
}
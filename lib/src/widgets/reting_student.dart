import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RetingStudent extends StatelessWidget {
  final List bestStudents;

  const RetingStudent({super.key, required this.bestStudents});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80.w),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50 , left: 20),
                child: Stack(
                  children: [
                    SvgPicture.asset(CommonAssets.vector , width: 60.w,),
                    Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Text(
                        "10000",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.w),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 105.w,
                  height: 105.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                  child: Image.asset(CommonAssets.avatar,
                      width: 72.w, fit: BoxFit.cover)),
              Container(
                width: 105.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(CommonAssets.medal2,
                        width: 35.w),
                  ],
                ),
              )
            ],
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50 , left: 20),
              child: Stack(
                children: [
                  SvgPicture.asset(CommonAssets.vector , width: 60.w, colorFilter: const ColorFilter.mode(cFFD700, BlendMode.srcIn),),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Text(
                      "10000",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.w),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: 105.w,
                height: 105.w,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: cFFD700),
                    borderRadius: BorderRadius.circular(50)),
                child: Image.asset(CommonAssets.avatar,
                    width: 72.w, fit: BoxFit.cover)),
            Container(
              width: 105.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(CommonAssets.medal1,
                      width: 35.w),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top : 80.h),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50 , left: 20),
                child: Stack(
                  children: [
                    SvgPicture.asset(CommonAssets.vector , width: 60.w,colorFilter: const ColorFilter.mode(cCD7F32, BlendMode.srcIn),),
                    Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Text(
                        "10000",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.w),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 105.w,
                  height: 105.w,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: cCD7F32),
                      borderRadius: BorderRadius.circular(50)),
                  child: Image.asset(CommonAssets.avatar,
                      width: 72.w, fit: BoxFit.cover)),
              Container(
                width: 105.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(CommonAssets.medal3,
                        width: 35.w),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

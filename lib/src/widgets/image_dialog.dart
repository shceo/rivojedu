import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

customsShowBottomSheet(
  BuildContext context,
) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(18.w),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Rasmni o’zgartirish",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1.w, color: c575757),
                ),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                color: grey.withOpacity(0.5))
                          ],
                        ),
                        child: SvgPicture.asset(CommonAssets.camera,
                            width: 70.w, fit: BoxFit.cover)),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text(
                      "Rasmga olish",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.w,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 1.w, color: c575757)),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 4),
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: grey.withOpacity(0.5))
                      ],
                    ),
                    child: SvgPicture.asset(CommonAssets.file,
                        width: 70.w, fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Text(
                    "Galereyadan olish",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.w,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),

            ),
            SizedBox(height: 30,),
          ],
        ),
      );
    },
  );
}

import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/screens/auth/widgets/w_back_button.dart';
import 'package:edu/src/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(CommonAssets.background,
            width: double.infinity, fit: BoxFit.cover),
        Padding(
          padding:  EdgeInsets.all(20.sp),
          child: ListView(
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WBackButton(),
                  Text(
                    "Eslatmalar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  10.verticalSpace,
                ],
              ),
              50.verticalSpace,
              ...List.generate(10, (index) {
                return const NotificationItem();
              })
            ],
          ),
        )
      ],
    ));
  }
}

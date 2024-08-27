import 'package:edu/src/ui/pages/screens/auth/views/sing_in.dart';
import 'package:edu/src/ui/pages/screens/lesson_screen/widgets/widgets.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/w_button.dart';

class ResentPassword extends StatefulWidget {
  const ResentPassword({super.key});

  @override
  State<ResentPassword> createState() => _ResentPasswordState();
}

class _ResentPasswordState extends State<ResentPassword> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController replyPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: Appbar(
          title: 'Parolni qayta tiklash',
          onTap: () {},
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 62.h),
              Text(
                "Yangi parol yarating",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: (20.w),
                  color: blackDark,
                ),
              ),
              SizedBox(height: (67.w)),
              VerticalItem(
                controllerOne: newPasswordController,
                controllerTwo: replyPasswordController,
              ),
              const Spacer(),
              WButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return const SignInView();
                  }));
                },
                padding: EdgeInsets.symmetric(vertical: 16.w),
                color: blue,
                child: Text(
                  "Saqlash",
                  style: TextStyle(fontSize: 18.w, color: white),
                ),
              ),
              42.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}

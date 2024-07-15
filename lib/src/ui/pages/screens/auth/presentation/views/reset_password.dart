import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../theme/app_themes.dart';
import '../widgets/w_button.dart';
import '../widgets/widgets.dart';

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
          padding: EdgeInsets.symmetric(horizontal: (20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: (62.3)),
              Text(
                "Yangi parol yarating",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: (20),
                  color: blackDark,
                ),
              ),
              SizedBox(height: (67.5)),
              VerticalItem(
                controllerOne: newPasswordController,
                controllerTwo: replyPasswordController,
              ),
              const Spacer(),
              WButton(
                onTap: () {},
                padding: EdgeInsets.symmetric(vertical: (16)),
                color: blue,
                child: Text(
                  "Saqlash",
                  style: TextStyle(fontSize:(18), color: white),
                ),
              ),
              SizedBox(height: (42)),
            ],
          ),
        ),
      ),
    );
  }
}

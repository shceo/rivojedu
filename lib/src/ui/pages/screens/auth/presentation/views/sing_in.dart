import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/home_page.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/formatters.dart';
import '../widgets/text_feild_custom.dart';
import '../widgets/w_button.dart';
import 'forgot_password.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: (25.h), vertical: (70.w)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: (65.w)),
                child: Image.asset(CommonAssets.rivojLogo),
              ),
              10.getH(),
              Center(
                child: Text(
                  "Akkauntga kirish",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.w,
                  ),
                ),
              ),
              37.getH(),
              Text(
                "Telefon raqam",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.w,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.getH(),
              TextFieldCustom(
                formKey: _formKey,
                title: "Telefon raqamingizni kiriting",
                isPassword: isPassword,
                keyBoardType: TextInputType.phone,
                maskTextInputFormatter: Formatters.phoneFormatter,
                focusNode: null,
              ),
              30.getH(),
              Text(
                "Parol",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.w,
                  fontWeight: FontWeight.w500,
                ),
              ),
              8.getH(),
              TextFieldCustom(
                formKey: _formKey,
                title: "Parol",
                isPassword: true,
                keyBoardType: TextInputType.text,
                maskTextInputFormatter: null,
                focusNode: null,
              ),
              const Spacer(),
              WButton(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                text: 'Kirish',
                textStyle: TextStyle(fontSize: 25.w, color: Colors.white),
              ),
              32.getH(),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const ForgotPassword()));
                  },
                  child: Text(
                    "Parolni unutdingizmi ?",
                    style: TextStyle(fontSize: 22.w, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

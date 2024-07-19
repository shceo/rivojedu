import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/domain/api/auth_swagger/auth_api.dart';
import 'package:edu/src/domain/api/data/auth_model.dart';
import 'package:edu/src/ui/pages/home_page.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/constants/common_dimensions.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/formatters.dart';
import '../widgets/text_feild_custom.dart';
import 'forgot_password.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
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
                  style: GoogleFonts.archivo(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: CommonDimensions.largeText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              37.getH(),
              Padding(
                padding: const EdgeInsets.only(left: CommonDimensions.medium),
                child: Text(
                  "Telefon raqam",
                  style: GoogleFonts.archivo(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: CommonDimensions.defaultTextSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              8.getH(),
              TextFieldCustom(
                formKey: _formKey,
                controller: _phoneController,
                title: "Telefon raqamingizni kiriting",
                isPassword: isPassword,
                keyBoardType: TextInputType.phone,
                maskTextInputFormatter: Formatters.phoneFormatter,
                focusNode: null,
              ),
              30.getH(),
              Padding(
                padding: const EdgeInsets.only(left: CommonDimensions.medium),
                child: Text(
                  "Parol",
                  style: GoogleFonts.archivo(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: CommonDimensions.defaultTextSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              8.getH(),
              TextFieldCustom(
                formKey: _formKey,
                controller: _passwordController,
                title: "Parol",
                isPassword: true,
                keyBoardType: TextInputType.text,
                maskTextInputFormatter: null,
                focusNode: null,
              ),
              const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      debugPrint("ONTAP BUTTON");
                      UserAuth.signIn(
                        _phoneController.text,
                        _passwordController.text,
                      ).then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      });
                    }
                    else {
                      Fluttertoast.showToast(msg: 'Такого пользователя нет');
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: blue,
                  ),
                  child: Center(
                    child: Text(
                      "Kirish",
                      style: TextStyle(
                        fontSize: 25.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
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

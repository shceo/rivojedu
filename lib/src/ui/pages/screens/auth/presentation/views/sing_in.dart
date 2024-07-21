import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/domain/api/auth_swagger/auth_api.dart';
import 'package:edu/src/ui/pages/home_page.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/formatters.dart';
import '../widgets/my_function.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: (25.h), vertical: (70.w)),
            child: Form(
              key: _formKey,
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
                    controller: _phoneController,
                    title: "Telefon raqamingizni kiriting",
                    isPassword: isPassword,
                    keyBoardType: TextInputType.phone,
                    maskTextInputFormatter: Formatters.phoneFormatter,
                    validator: (value) {
                      debugPrint(
                          "-------------phone number validate---------------");
                      if (value == null || value.isEmpty) {
                        return 'Raqamni kiriting';
                      } else if (MyFunctions.validatePhoneNumber(value)) {
                        return 'Raqam noto\'g\'ri formatda';
                      }
                      return null;
                    },
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
                    controller: _passwordController,
                    title: "Parol",
                    isPassword: !isPassword,
                    keyBoardType: TextInputType.text,
                    maskTextInputFormatter: null,
                    validator: (value) {
                      debugPrint(
                          "-------------password validate---------------");
                      if (value == null || value.isEmpty || value.length < 8) {
                        return 'Passwordni to\'liq kiriting';
                      }
                      return null;
                    },
                  ),
                  // const Spacer(),
                  265.getH(),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        UserAuth.signIn(
                          _phoneController.text,
                          _passwordController.text,
                        ).then((_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                          );
                        });
                      } else {
                        Fluttertoast.showToast(msg: 'user not found');
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
        ),
      ),
    );
  }
}

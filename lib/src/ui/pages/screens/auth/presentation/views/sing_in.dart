import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/home_page.dart';
import 'package:edu/src/ui/pages/routes/app_navigator.dart';
import 'package:edu/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../widgets/formatters.dart';
import '../widgets/text_feild_custom.dart';
import '../widgets/w_button.dart';
import 'forgot_password.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: (55)),
              child: Image.asset(
                CommonAssets.rivojLogo,
                // width: 255,
                // height: 99,
              ),
            ),
            const SizedBox(
              height: (10),
            ),
            Center(
              child: Text(
                "Akkauntga kirish",
                style: GoogleFonts.archivo(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: CommonDimensions.largeText,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: (37),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
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
            const SizedBox(
              height: 8,
            ),
            TextFieldCustom(
              formKey: _formKey,
              title: "Telefon raqamingizni kiriting",
              isPassword: false,
              keyBoardType: TextInputType.phone,
              maskTextInputFormatter: Formatters.phoneFormatter,
              focusNode: null,
            ),
            const SizedBox(
              height: (30),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
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
            const SizedBox(
              height: (8),
            ),
            TextFieldCustom(
              formKey: _formKey,
              title: 'Parol',
              isPassword: true,
              keyBoardType: TextInputType.text,
              maskTextInputFormatter: null,
              focusNode: null,
            ),
            const Spacer(),
            WButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              text: 'Kirish',
              textStyle: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: (32),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const ForgotPassword()));
                  },
                  child: const Text(
                    "Parolni unutdingizmi ?",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                    textAlign: TextAlign.center,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

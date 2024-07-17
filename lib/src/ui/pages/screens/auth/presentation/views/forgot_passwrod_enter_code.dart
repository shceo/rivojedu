import 'package:edu/src/ui/pages/screens/auth/presentation/views/reset_password.dart';
import 'package:edu/src/ui/pages/screens/auth/presentation/widgets/w_back_button.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../../../theme/app_themes.dart';
import '../widgets/buton_item.dart';

class ForgotPasswordEnterCode extends StatefulWidget {
  const ForgotPasswordEnterCode({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<ForgotPasswordEnterCode> createState() =>
      _ForgotPasswordEnterCodeState();
}

class _ForgotPasswordEnterCodeState extends State<ForgotPasswordEnterCode> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                const WBackButton(),
                Text(
                  "Parolni unutdingizmi ?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 28.w,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Text(
              "Kod +998****${widget.phoneNumber.substring(13)} raqamiga jo’natildi",
              style: TextStyle(color: dark, fontSize: 18.w),
            ),
            const SizedBox(height: 7),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Pinput(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                length: 4,
                validator: (s) {
                  return s == '2222' ? null : "Noto'g'ri parol";
                },
                defaultPinTheme: PinTheme(
                  width: 67,
                  height: 60,
                  textStyle: const TextStyle(color: Colors.black),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textFieldBorder,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'OTP kod qayta yuborilsinmi? ',
                      style: TextStyle(color: Colors.black, fontSize: 15.w)),
                  TextSpan(
                      text: 'Bu yerni bosing.!',
                      style: TextStyle(color: Colors.red, fontSize: 15.w)),
                ],
              ),
            ),
            const Spacer(),
            ButtonItem(
                text: "Keyingisi",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ResentPassword()),
                  );
                }),
            const SizedBox(height: 43)
          ],
        ),
      ),
    );
  }
}

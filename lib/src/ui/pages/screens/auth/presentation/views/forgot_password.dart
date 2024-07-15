import 'package:edu/src/ui/pages/screens/auth/presentation/widgets/w_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../theme/app_themes.dart';
import '../widgets/buton_item.dart';
import 'forgot_passwrod_enter_code.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                WBackButton(),
                Text(
                  "Parolni unutdingizmi ?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Text(
              "Telefon raqam",
              style: TextStyle(color: dark, fontSize: 20),
            ),
            const SizedBox(height: 7),
            TextField(
              controller: controller,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 20,
              ),
              // inputFormatters: [Formatters.phoneFormatter],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Telefon raqamni kiriting",
                hintStyle:TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 20,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: textFieldBorder, width: 1),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: textFieldBorder, width: 1),
                ),
              ),
            ),
            const Spacer(),
            ButtonItem(
              text: "Keyingisi",
              onTap: () {
                String t = controller.text.replaceAll("-", "");
                if (t.length == 17) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          ForgotPasswordEnterCode(phoneNumber: t),
                    ),
                  );
                } else {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      color: red,
                      height: 80,
                      child: Center(
                        child: Text(
                          'Telefon raqam kiriting!',
                          style:TextStyle(
                            fontSize: 18,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  );
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.of(context).pop();
                  });
                }
              },
            ),
            const SizedBox(height: 43),
          ],
        ),
      ),
    );
  }
}

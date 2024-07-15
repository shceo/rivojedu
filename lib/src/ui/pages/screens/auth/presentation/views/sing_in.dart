import 'package:edu/assets/constatnts/common_assets.dart';
import 'package:flutter/material.dart';
import '../widgets/formatters.dart';
import '../widgets/text_feild_custom.dart';
import '../widgets/w_button.dart';
import 'forgot_password.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: (25),vertical: (70)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal:(65)),
              child: Image.asset(CommonAssets.rivojLogo,),
            ),
            SizedBox(height:(10),),
            Center(
              child: Text("Akkauntga kirish",style: TextStyle(
                color: Colors.black,
                fontSize: 26,),
              ),
            ),
            SizedBox(height:(37),),
            Text("Telefon raqam",style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: (8),),
            TextFieldCustom(
              formKey: _formKey,
              title: "Telefon raqamingizni kiriting",
              isPassword: false,
              keyBoardType: TextInputType.phone,
              maskTextInputFormatter: Formatters.phoneFormatter,
              focusNode: null,
            ),
            SizedBox(height:(30),),
            Text("Parol",style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height:(8),),
            TextFieldCustom(
              formKey: _formKey,
              title: "",
              isPassword: true,
              keyBoardType: TextInputType.text,
              maskTextInputFormatter: null,
              focusNode: null,
            ),
            const Spacer(),
            WButton(onTap: (){},text: 'Kirish',textStyle: TextStyle(fontSize: 25),),
            SizedBox(height: (32),),
            Center(
              child: TextButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ForgotPassword()));
                  }
                  , child : Text("Parolni unutdingizmi ?",
                style: TextStyle(fontSize: 20,color: Colors.blue),
                textAlign: TextAlign.center,
              )
              ),
            )

          ],
        ),
      ),
    );
  }
}

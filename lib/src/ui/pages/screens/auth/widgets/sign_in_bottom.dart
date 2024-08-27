import 'package:flutter/material.dart';

class SignInBottom extends StatelessWidget {
  const SignInBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
        borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        child: Text("Kirish",style:TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

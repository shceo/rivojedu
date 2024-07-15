import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../theme/app_themes.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin : const EdgeInsets.symmetric(horizontal: 27),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            color : blue,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Text(
          "Keyingisi",
          style:TextStyle(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

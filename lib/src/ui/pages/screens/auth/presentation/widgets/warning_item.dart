import 'package:flutter/material.dart';

import '../../../../../theme/app_themes.dart';

class WarningItem extends StatelessWidget {
  const WarningItem({
    super.key,
    required this.imagePath,
    required this.text,
  });

  final String imagePath;
  final String text;

  get white => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: (28),
        horizontal: (45),
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular((20)),
        boxShadow: [
          BoxShadow(
            // color white bolganda shadow korinmayabdi!!
            // color: white.withOpacity(0.25),
            color: blackDark.withOpacity(0.25),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: (70),
            width: (70),
          ),
          SizedBox(height: (14)),
          Text(
            text,
            style: TextStyle(
              fontSize: (20),
              color: blackDark,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

import 'package:edu/assets/constants/common_assets.dart';
import 'package:flutter/material.dart';

class BestStudentItem extends StatelessWidget {
  const BestStudentItem({super.key, required this.color, required this.icon});
  final Color color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: color)),
              child: Image.asset(CommonAssets.avatar,
                  width: 75, fit: BoxFit.cover),
            ),
            Container(
              width: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(icon,
                      width: 33, fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
        Text(
          "100",
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          "Ergashev Ali",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

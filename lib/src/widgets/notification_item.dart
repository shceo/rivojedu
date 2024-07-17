import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(18),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color : Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0 , 4),
                  color : grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4
              )
            ]
        ),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "21 march 2024",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "19 : 21",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Text(
              "Homework not done ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Homework time! Please complete your lesson unit 12.3. Good luck",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ],
        )
    );
  }
}

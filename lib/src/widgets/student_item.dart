import 'package:edu/assets/constants/common_assets.dart';
import 'package:flutter/material.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 65, left: 10, right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(CommonAssets.coin, width: 30, fit: BoxFit.cover),
              const Text(
                "120",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 30,
              ),
              const Text(
                "120",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Image.asset(CommonAssets.star, width: 30, fit: BoxFit.cover),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Center(
            child:
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 2,
                        color : Colors.white
                      )
                    ),
                    child: Image.asset(CommonAssets.avatar, width: 95, fit: BoxFit.cover)),
          ),
        ),
      ],
    );
  }
}

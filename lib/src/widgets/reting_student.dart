import 'package:edu/assets/constants/common_assets.dart';
import 'package:flutter/material.dart';

class RetingStudent extends StatelessWidget {
  const RetingStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 150,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    CommonAssets.reyting2,
                    height: 108,
                  ),
                  const Text(
                    "Ergashev Ali",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100, left: 16),
                child: Text(
                  "11 000",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    CommonAssets.reyting1,
                    height: 108,
                  ),
                  const Text(
                    "Ergashev Ali",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 80, left: 15),
                child: Text(
                  "11 000",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 170,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    CommonAssets.reyting3,
                    height: 108,
                  ),
                  const Text(
                    "Ergashev Ali",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 120, left: 15),
                child: Text(
                  "11 000",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

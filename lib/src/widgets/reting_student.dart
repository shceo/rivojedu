import 'package:edu/assets/constants/common_assets.dart';
import 'package:flutter/material.dart';

class RetingStudent extends StatelessWidget {
  final List bestStudents;

  const RetingStudent({super.key, required this.bestStudents});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Text(
                    "${bestStudents[1]['name']} ${bestStudents[1]['surname']}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 16),
                child: Text(
                  "${bestStudents[1]['percentage']}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              ),
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
                  Text(
                    "${bestStudents[0]['name']} ${bestStudents[0]['surname']}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 15),
                child: Text(
                  "${bestStudents[0]['percentage']}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              ),
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
                  Text(
                    "${bestStudents[2]['name']} ${bestStudents[2]['surname']}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 15),
                child: Text(
                  "${bestStudents[2]['percentage']}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

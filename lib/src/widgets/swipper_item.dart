import 'package:edu/src/ui/pages/screens/lesson_screen/lesson_screen.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:edu/src/widgets/dars_item.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SwipperItem extends StatefulWidget {
  const SwipperItem({super.key});

  @override
  State<SwipperItem> createState() => _SwipperItemState();
}

class _SwipperItemState extends State<SwipperItem> {
  int selectedLesson = 0;
  int selectedModul = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Modul 1",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.w,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) {
                  return DarsItem(
                    tap: selectedLesson == index,
                    onTap: () {
                      setState(() {
                        selectedLesson = index;
                      });
                    },
                    text: "Dars ${index + 1}",
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 170,
            child: Swiper(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(
                      width: 1.w,
                      color: grey,
                    ),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LessonScreen();
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Rasmlarni qayta ishlash...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Text(
                                "80",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                padding: const EdgeInsets.all(1),
                                width: 220,
                                height: 27,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 160,
                                      decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 18.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dars 2.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.w,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.w,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: 3,
              viewportFraction: 0.8,
              scale: 0.9,
              pagination: null,
              control: null,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(modul.length, (index) {
                  return DarsItem(
                    tap: selectedModul == index,
                    onTap: () {
                      setState(() {
                        selectedModul = index;
                      });
                    },
                    text: modul[index],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> modul = [
  "Modul I",
  "Modul II",
  "Modul III",
];

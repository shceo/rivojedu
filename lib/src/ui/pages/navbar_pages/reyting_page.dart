import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:edu/src/widgets/reting_student.dart';
import 'package:edu/src/widgets/reyting_item.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(CommonAssets.background,
              width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Reyting",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 25.w),
                ),
                 SizedBox(
                  height: 16.h,
                ),
                const RetingStudent(),
                SizedBox(
                  height: 60.h,
                ),
                ReytingItem(
                  a: a,
                  onTap: () {
                    a = 0;
                    setState(() {});
                  },
                  onTap1: () {
                    a = 1;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  color: grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 4)
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${index + 4}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.w,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                CommonAssets.avatar,
                                width: 60.w,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Expanded(
                                child: Text(
                                  "Ergashev Ali",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.w,
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Text(
                                "11 000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.w,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              Image.asset(CommonAssets.star,
                                  width: 30, fit: BoxFit.cover)
                            ],
                          ));
                    },
                  ),
                ),
                SizedBox(height: 30.h,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

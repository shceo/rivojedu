import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';

class EditPasswordItem extends StatelessWidget {
  const EditPasswordItem({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 11.w),
      decoration: BoxDecoration(
          border: Border.all(color: c575757.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Oldingi parol",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.w,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 44.h,
            child: TextField(
              style: TextStyle(color: blackDark, fontSize: 15.w),
              decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.only(bottom: 10.w, left: 10.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.w, color: c575757),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.w, color: c575757),
                  )),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Yangi parol",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.w,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 44.h,
            child: TextField(
              style: TextStyle(color: blackDark, fontSize: 15.w),
              decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.only(bottom: 10.w, left: 10.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.w, color: c575757),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.w, color: c575757),
                  )),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Parolni tasdiqlash",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.w,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 44.h,
            child: TextField(
              style: TextStyle(color: blackDark, fontSize: 15.w),
              decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.only(bottom: 10.w, left: 10.w),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.w, color: c575757),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1.w, color: c575757),
                  )),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap : onTap,
                child: Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 8.h, horizontal: 28),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1.w, color: c575757.withOpacity(0.5))),
                  child: Text(
                    "Bekor qilish",
                    style: TextStyle(
                        color: blue,
                        fontSize: 12.w,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              GestureDetector(
                onTap : onTap,
                child: Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 8.h, horizontal: 28),
                  decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1.w, color: c575757.withOpacity(0.5))),
                  child: Text(
                    "Saqlash",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.w,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../theme/app_themes.dart';

class ProfileFieldItem extends StatefulWidget {
  const ProfileFieldItem({
    super.key,
    required this.themeText,
    required this.continueText,
    required this.url,
  });

  final String themeText;
  final String continueText;
  final String url;

  @override
  State<ProfileFieldItem> createState() => _ProfileFieldItemState();
}

class _ProfileFieldItemState extends State<ProfileFieldItem> {
  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://flutter.dev');

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        color: white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: const Offset(0, 0),
            color: blackDark.withOpacity(.25),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
            child: Text(
              "Introduction",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.w,
                color: c235789,
              ),
            ),
          ),
          Divider(color: EDEEF0, height: 1.h),
          5.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Mavzu : ",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.w,
                        color: blackDark,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.themeText,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.w,
                            color: c575757,
                          ),
                        ),
                      ]),
                ),
                11.getH(),
                RichText(
                  text: TextSpan(
                      text: "Davomiyligi -  ",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.w,
                        color: blackDark,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.continueText,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.w,
                            color: c575757,
                          ),
                        ),
                      ]),
                ),
                12.getH(),
                Text(
                  "Qo’shimcha dars uchun linklar : ",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.w,
                    color: blackDark,
                  ),
                ),
                10.getH(),
                GestureDetector(
                  onTap: () async {
                    _launchUrl();
                  },
                  child: Text(
                    widget.url,
                    style: TextStyle(
                      fontSize: 12.w,
                      fontWeight: FontWeight.w500,
                      color: c0340F0,
                    ),
                  ),
                ),
                20.getH(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

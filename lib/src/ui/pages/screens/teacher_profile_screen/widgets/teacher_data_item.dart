import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../theme/app_themes.dart';

class TeacherDataItem extends StatefulWidget {
  const TeacherDataItem({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;

  @override
  State<TeacherDataItem> createState() => _TeacherDataItemState();
}

class _TeacherDataItemState extends State<TeacherDataItem> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: CircleAvatar(
                    radius: 50.w,
                    backgroundColor: Colors.white,
                  ),
                )
              : CircleAvatar(
                  radius: 50.w,
                  backgroundImage: NetworkImage(widget.imageUrl),
                ),
          13.verticalSpace,
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 30.w,
              fontWeight: FontWeight.w700,
              color: blackDark,
            ),
          ),
        ],
      ),
    );
  }
}

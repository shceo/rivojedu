import 'package:edu/src/utils/size/size.dart';
import 'package:flutter/cupertino.dart';

import '../../../../theme/app_themes.dart';

class NextButtonItem extends StatelessWidget {
  const NextButtonItem({super.key, required this.voidCallback});

  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w),
          color: const Color(0xfff3f3f3),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Center(
          child: Text(
            "Barcha sharhlarni ko’rish",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.w,
              color: c235789,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:edu/assets/constatnts/common_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';


class WBackButton extends StatelessWidget {
  const WBackButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 36,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF0340F0).withOpacity(0.5)),
        child: SvgPicture.asset(CommonAssets.arrowBack),
      ),
      onTap: () => Navigator.pop(context),
    );
  }
}


import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/screens/auth/presentation/widgets/w_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../theme/app_themes.dart';

class Appbar extends StatelessWidget implements PreferredSize {
  const Appbar({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: (56),
      leading: GestureDetector(
        onTap: onTap,
        child: Container(
          height: (56),
          margin: EdgeInsets.only(
            left: (20),
            top: (10),
            bottom: (10),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((10)),
            color: blue.withOpacity(.5),
          ),
          child: Center(
            child: SvgPicture.asset(
              CommonAssets.arrowBack,
              height: (17.5),
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: (25),
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, (56));

  @override
  Widget get child => throw UnimplementedError();
}

class VerticalItem extends StatelessWidget {
  const VerticalItem({
    super.key,
    required this.controllerOne,
    required this.controllerTwo,
  });

  final TextEditingController controllerOne;
  final TextEditingController controllerTwo;
  final bool active = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: (10)),
          child: Text(
            "Yangi parol",
            style: TextStyle(
              fontSize: (18),
              color: blackDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height:(10)),
        WTextField(
          height: (60),
          hintText: "************",
          controller: controllerOne,
          hasSuffixIcon: !true,
          isObscure: true,
        ),
        SizedBox(height:(10)),
        Padding(
          padding: EdgeInsets.only(left: (10)),
          child: Text(
            "Parolni tasdiqlang",
            style: TextStyle(
              fontSize: (18),
              color: blackDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: (10)),
        WTextField(
          height: (60),
          hintText: "************",
          controller: controllerTwo,
          hasSuffixIcon: !true,
          isObscure: active,
        ),
      ],
    );
  }
}

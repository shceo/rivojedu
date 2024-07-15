import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MandatoryText extends StatelessWidget {
  final String text;
  final bool isMandatory;
  final String greyText;

  const MandatoryText(
      {required this.text,
      this.isMandatory = false,
      this.greyText = '',
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge!,
          ),
          Text(
            greyText,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          // if (isMandatory) SvgPicture.asset(AppIcons.edit),
        ],
      ),
    );
  }
}

// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:edu/src/ui/theme/theme_extensions.dart';
import 'package:edu/src/utils/constants/common_dimensions.dart';
import 'package:edu/src/widgets/custom_vector_image.dart';
import 'package:flutter/material.dart';

class CustomVectorButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? assetColor;
  final double? assetWidth;
  final double? assetHeight;
  final bool? isSmall;
  const CustomVectorButton({
    required this.assetPath,
    required this.onPressed,
    this.shape,
    this.backgroundColor,
    this.assetColor,
    this.assetWidth,
    this.assetHeight,
    this.isSmall,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isSmall == true) {
      return FloatingActionButton.small(
        elevation: CommonDimensions.none,
        backgroundColor: backgroundColor ?? context.theme.whiteColor,
        highlightElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  CommonDimensions.large,
                ),
              ),
              side: BorderSide(
                color: context.theme.whiteColor,
              ),
            ),
        onPressed: onPressed,
        child: CustomVectorImage(
          svgAssetPath: assetPath,
          color: assetColor ?? context.theme.whiteColor,
          width: assetWidth,
          height: assetHeight,
        ),
      );
    }
    return FloatingActionButton(
      elevation: CommonDimensions.none,
      backgroundColor: backgroundColor ?? context.theme.whiteColor,
      highlightElevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                CommonDimensions.large,
              ),
            ),
            side: BorderSide(
              color: context.theme.whiteColor,
            ),
          ),
      onPressed: onPressed,
      child: CustomVectorImage(
        svgAssetPath: assetPath,
        color: assetColor ?? context.theme.whiteColor,
        width: assetWidth,
        height: assetHeight,
      ),
    );
  }
}

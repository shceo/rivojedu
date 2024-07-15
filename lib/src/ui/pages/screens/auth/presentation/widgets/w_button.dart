import 'package:edu/src/ui/pages/screens/auth/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../theme/app_themes.dart';

class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Widget? icon;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color disabledColor;
  final bool isDisabled;
  final bool isLoading;
  final double? scaleValue;
  final List<BoxShadow>? shadow;
  final Gradient? gradient;

  const WButton({
    required this.onTap,
    this.child,
    this.text = '',
    this.color = blue,
    this.textColor = white,
    this.borderRadius = 12,
    this.disabledColor = grey,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    this.scaleValue,
    this.shadow,
    this.gradient,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      scaleValue: scaleValue ?? 0.98,
      onTap: () {
        if (!(isLoading || isDisabled)) {
          onTap();
        }
      },
      isDisabled: isDisabled,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height ?? 56,
        margin: margin,
        padding: padding ?? EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled ? shuttleGrey : color ?? blue,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          gradient: isDisabled
              ? null
              : color != null
                  ? null
                  : (gradient ??
                      const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.green, green],
                      )),
          boxShadow: shadow,
        ),
        child: isLoading
            ? Center(child: CupertinoActivityIndicator(color: textColor))
            : AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      height: 1.36,
                      color: isDisabled ? greyText : textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                child: icon != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icon!,
                          const SizedBox(width: 8),
                          child ?? _buildTextWidget()
                        ],
                      )
                    : child ?? _buildTextWidget(),
              ),
      ),
    );
  }

  Widget _buildTextWidget() {
    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

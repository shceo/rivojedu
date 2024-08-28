import 'package:edu/src/ui/pages/screens/auth/presentation/widgets/mandatory_text.dart';
import 'package:edu/src/ui/pages/screens/auth/widgets/stroke_paint.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class WTextField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final EdgeInsets contentPadding;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final double prefixMaxWidth;
  final double suffixMaxWidth;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? counterStyle;
  final String? hintText;
  final bool hasError;
  final bool isObscure;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final String title;
  final String greyTexts;
  final double? height;
  final double? width;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final bool? expands;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool showCount;
  final TextInputAction? textInputAction;
  final Color fillColor;
  final Color cursorColor;
  final Color focusColor;
  final Color enabledBorder;
  final bool readOnly;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final bool hasSuffixIcon;
  final String? counterText;
  final bool enabled;
  final bool isMandatory;

  const WTextField({
    this.autoFocus = false,
    this.hasSuffixIcon = true,
    this.showCount = false,
    this.readOnly = false,
    this.enabled = true,
    this.isMandatory = false,
    this.focusNode,
    this.textInputAction,
    this.maxLengthEnforcement,
    this.validator,
    this.counterText,
    this.counterStyle,
    this.controller,
    this.onChanged,
    this.prefix,
    this.width,
    this.title = '',
    this.greyTexts = '',
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.inputFormatters,
    this.suffix,
    this.prefixMaxWidth = 40,
    this.suffixMaxWidth = 40,
    this.hintStyle,
    this.hintText,
    this.style,
    this.isObscure = false,
    this.hasError = false,
    this.inputDecoration,
    this.keyboardType,
    this.height,
    this.maxLines,
    this.maxLength,
    this.textAlignVertical,
    this.expands,
    this.fillColor = Colors.white,
    this.cursorColor = green,
    this.focusColor = Colors.transparent,
    this.enabledBorder = whiteSmoke,
    this.minLines,
    super.key,
    this.onTap,
    this.onFieldSubmitted,
  });

  @override
  State<WTextField> createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField>
    with SingleTickerProviderStateMixin {
  bool isObscure = false;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animationController.forward();

    super.initState();
    isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty) ...[
          MandatoryText(
            text: widget.title,
            greyText: widget.greyTexts,
            isMandatory: widget.isMandatory,
          ),
          const SizedBox(height: 4),
        ],
        SizedBox(
          height: widget.height ?? 40,
          width: widget.width,
          child: TextFormField(
            onTap: widget.onTap ?? () {},
            enabled: widget.enabled,
            controller: widget.controller,
            readOnly: widget.readOnly,
            expands: widget.expands ?? false,
            maxLengthEnforcement: widget.maxLengthEnforcement,
            textAlignVertical: widget.textAlignVertical,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            autofocus: widget.autoFocus,
            onChanged: widget.onChanged,
            validator: widget.validator,
            obscureText: !isObscure,
            textInputAction: widget.textInputAction,
            style: widget.style ??
                Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: dark,
                    ),
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            maxLines: widget.isObscure ? 1 : widget.maxLines,
            minLines: widget.minLines,
            cursorColor: widget.cursorColor,
            cursorWidth: 1,
            cursorHeight: 20,
            decoration: widget.inputDecoration ??
                InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: widget.hasError ? red : greyText,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: widget.hasError ? red : green),
                  ),
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle ??
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: widget.hasError ? red : greyText,
                          ),
                  contentPadding: widget.contentPadding,
                  suffixIconConstraints:
                      BoxConstraints(maxWidth: widget.suffixMaxWidth),
                  suffixIcon: widget.hasSuffixIcon
                      ? widget.suffix ?? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                              if (isObscure) {
                                animationController.forward();
                              } else {
                                animationController.reverse();
                              }
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              alignment: Alignment.center,
                              child: Center(
                                child: AnimatedBuilder(
                                  animation: animationController,
                                  child: const Icon(CupertinoIcons.eye),
                                  builder: (context, child) => SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CustomPaint(
                                      foregroundPainter: StrokePaint(
                                        animationController.value,
                                      ),
                                      child: child,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                  fillColor: widget.fillColor,
                  filled: true,
                  prefixIconConstraints:
                      BoxConstraints(maxWidth: widget.prefixMaxWidth),
                  prefixIcon: widget.prefix,
                  counterText: widget.counterText,
                  counterStyle: widget.counterStyle,
                ),
          ),
        ),
      ],
    );
  }
}

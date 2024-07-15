import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WScaleAnimation extends StatefulWidget {
  final int id;
  final Widget child;
  final VoidCallback onTap;
  final Duration duration;
  final double scaleValue;
  final bool isDisabled;

  const WScaleAnimation({
    required this.onTap,
    required this.child,
    super.key,
    this.id = 1,
    this.isDisabled = false,
    this.duration = const Duration(milliseconds: 150),
    this.scaleValue = 0.95,
  })  : assert(scaleValue <= 1 && scaleValue >= 0,
            'Range error: Range should be between [0,1]');

  @override
  State<WScaleAnimation> createState() => _WScaleAnimationState();
}

class _WScaleAnimationState extends State<WScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: widget.scaleValue,
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (!widget.isDisabled) {
            widget.onTap();
          }
        },
        onPanDown: (details) {
          if (!widget.isDisabled) {
            _controller.forward();
          }
        },
        onPanCancel: () {
          if (!widget.isDisabled) {
            _controller.reverse();
          }
        },
        onPanEnd: (details) {
          if (!widget.isDisabled) {
            _controller.reverse();
          }
        },
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: widget.child,
        ),
      );
}

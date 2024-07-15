import 'package:flutter/material.dart';

class StrokePaint extends CustomPainter {
  final double progress;
  final p1 = const Offset(4, 20);
  final p2 = const Offset(20, 4);
  final interpolateY = Interpolate(
      inputRange: [0, 1], outputRange: [20, 4], extrapolate: Extrapolate.clamp);
  final interpolateX = Interpolate(
      inputRange: [0, 1], outputRange: [4, 20], extrapolate: Extrapolate.clamp);

  StrokePaint(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final interpolateW = Interpolate(
        inputRange: [0, 1],
        outputRange: [size.width, 5],
        extrapolate: Extrapolate.clamp);
    final interpolateH = Interpolate(
        inputRange: [0, 1],
        outputRange: [4, size.height - 5],
        extrapolate: Extrapolate.clamp);
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..color = const Color.fromRGBO(140, 151, 171, 1);
    final paint2 = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..color = const Color.fromRGBO(255, 255, 255, 1);
    final finalPainter = progress == 1 ? Paint() : paint;
    final path = Path()
      ..moveTo(interpolateH.eval(progress), interpolateW.eval(progress) - 3)
      ..lineTo(size.width - 4, 3)
      ..lineTo(size.width - 3, 6)
      ..lineTo(
          interpolateH.eval(progress) + 1, interpolateW.eval(progress) - 2);
    canvas
      ..drawPath(path, paint2)
      ..drawLine(
          Offset(interpolateX.eval(progress), interpolateY.eval(progress)),
          p2,
          finalPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate != this;
}

enum Extrapolate {
  extend,
  clamp,
  clampStart,
  clampEnd,
}

/// @param: List<double> inputRage
///
/// @param: List<double> outputRage
///
/// @param: Extrapolate extrapolate =  Extrapolate.extend
class Interpolate {
  late List<double> _x;
  late List<double> _y;
  late Extrapolate extrapolate;

  Interpolate(
      {required List<double> inputRange,
        required List<double> outputRange,
        this.extrapolate = Extrapolate.extend}) {
    _x = inputRange.map((e) => e.toDouble()).toList();
    _y = outputRange.map((e) => e.toDouble()).toList();
    assert(_x.length == _y.length,
    'interpolate: the length of inputRange must be equal to the length ot the outputRange');
    assert(_x.length >= 2 && _y.length >= 2,
    'interpolate: the range should have more than two data points');
  }

  /// execute the interpolation in the range
  /// if the interpolation is clamped the return value will not be extended
  double eval(double val) {
    if (val <= _x.first) {
      if (extrapolate == Extrapolate.clampStart ||
          extrapolate == Extrapolate.clamp) {
        return _y.first;
      } else {
        return _interpolateLine([_y[1], _y.first], [_x[1], _x.first], val);
      }
    } else {
      for (var i = 0; i < _x.length; i++) {
        if (val < _x[i]) {
          return _interpolateLine([_x[i], _x[i - 1]], [_y[i], _y[i - 1]], val);
        }
        if (val == _x[i]) {
          return _y[i];
        }
      }

      if (val > _x.last) {
        if (extrapolate == Extrapolate.clamp ||
            extrapolate == Extrapolate.clampEnd) {
          return _y.last;
        } else {
          final i = _x.length - 1;
          return _interpolateLine(
              [_x[i - 1], _x.last], [_y[i - 1], _y.last], val);
        }
      }
    }
    return 0;
  }

  static double _interpolateLine(List<double> x, List<double> y, double val) {
    final x0 = x[0];
    final x1 = x[1];
    final y0 = y[0];
    final y1 = y[1];
    final val0 = y0 + (val - x0) * ((y1 - y0) / (x1 - x0));
    return val0;
  }
}

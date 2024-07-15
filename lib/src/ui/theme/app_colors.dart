import 'dart:ui';
import 'package:equatable/equatable.dart';

final class AppColors extends Equatable {
  final Color whiteColor;
  final Color longGrey;
  final Color green;
  final Color red;
  final Color dark;
  final Color darkText;
  final Color grey;
  final Color iron;
  final Color whiteSmoke;
  final Color greyText;
  final Color whiteGrey;
  final Color blackGrey;
  final Color blue;
  final Color lightBlue;
  final Color shuttleGrey;

  @override
  List<Object?> get props => [
        whiteColor,
        longGrey,
        green,
        red,
        dark,
        darkText,
        grey,
        iron,
        whiteSmoke,
        greyText,
        whiteGrey,
        blackGrey,
        blue,
        lightBlue,
        shuttleGrey,
      ];

  const AppColors({
    required bool isDark,
    required this.whiteColor,
    required this.green,
    required this.longGrey,
    required this.dark,
    required this.darkText,
    required this.red,
    required this.grey,
    required this.iron,
    required this.whiteSmoke,
    required this.blackGrey,
    required this.greyText,
    required this.whiteGrey,
    required this.blue,
    required this.lightBlue,
    required this.shuttleGrey,
  });
}

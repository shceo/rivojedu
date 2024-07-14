import 'dart:ui';
import 'package:equatable/equatable.dart';

final class AppColors extends Equatable {
  final bool isDark;
  final Color whiteColor;

  @override
  List<Object?> get props => [
        isDark,
        whiteColor,
      ];

  const AppColors({
    required this.isDark,
    required this.whiteColor,
  });
}

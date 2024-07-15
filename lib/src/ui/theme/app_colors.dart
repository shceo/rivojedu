import 'dart:ui';
import 'package:equatable/equatable.dart';

final class AppColors extends Equatable {
  final Color whiteColor;

  @override
  List<Object?> get props => [
  
        whiteColor,
      ];

  const AppColors({
    required bool isDark,
    required this.whiteColor,
    required Color green,
  
  });
}

import 'package:edu/src/ui/theme/app_colors.dart';
import 'package:edu/src/ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  AppColors get theme => ThemeProvider.of(this).theme;
  ThemeData get themeData => ThemeProvider.of(this).themeData;
}

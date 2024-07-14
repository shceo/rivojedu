
import 'package:edu/src/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

final class ThemeProvider extends InheritedWidget {
  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }

  final AppColors theme;


  const ThemeProvider({
    required this.theme,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return theme != oldWidget.theme;
  }
}

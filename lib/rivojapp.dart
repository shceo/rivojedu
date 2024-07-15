import 'package:edu/src/ui/pages/routes/app_navigator.dart';
import 'package:edu/src/ui/theme/app_colors.dart';
import 'package:edu/src/ui/theme/theme_extensions.dart';
import 'package:edu/src/ui/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatelessWidget {
    final themeData = ThemeData(useMaterial3: true);
   App({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigator.router,
     theme: ThemeData(useMaterial3: true)
    );
  }
}

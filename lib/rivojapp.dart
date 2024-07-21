import 'package:edu/src/localization/flutter_gen/rivojLocalizations.dart';
import 'package:edu/src/ui/pages/routes/app_navigator.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final themeData = ThemeData(useMaterial3: true);

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigator.router,
      localizationsDelegates: RivojLocalization.localizationsDelegates,
      supportedLocales: RivojLocalization.supportedLocales,
      theme: ThemeData(useMaterial3: true),
    );
  }
}

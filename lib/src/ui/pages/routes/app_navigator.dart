import 'package:edu/src/ui/pages/home_page.dart';
import 'package:edu/src/ui/pages/routes/app_routes.dart';
import 'package:edu/src/ui/pages/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => HomePage(),
      ),
    ],
  );
}

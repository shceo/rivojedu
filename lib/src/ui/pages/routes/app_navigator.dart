import 'package:edu/src/ui/pages/home_page.dart';
import 'package:edu/src/ui/pages/screens/auth/views/forgot_password.dart';
import 'package:edu/src/ui/pages/screens/auth/views/reset_password.dart';
import 'package:edu/src/ui/pages/screens/auth/views/sing_in.dart';
import 'package:edu/src/ui/pages/routes/app_routes.dart';
import 'package:edu/src/ui/pages/screens/splash/splash_screen.dart';
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
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => const ForgotPassword(),
      ),
      GoRoute(
        path: Routes.signIn,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: Routes.resetPasswordEntry,
        builder: (context, state) => const ResentPassword(),
      ),
    ],
  );
}

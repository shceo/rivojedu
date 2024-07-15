import 'package:edu/src/domain/blocs/splash_bloc/splash_screen_bloc.dart';
import 'package:edu/src/ui/pages/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashScreenState>(
      listener: (context, state) {
        if (state is AppLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go(Routes.home);
          });
        }
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration:const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sscreen.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



import 'package:edu/src/domain/blocs/all_lessons_bloc/all_lessons_bloc.dart';
import 'package:edu/src/domain/blocs/all_modules_bloc/all_modules_bloc.dart';
import 'package:edu/src/domain/blocs/splash_bloc/splash_screen_bloc.dart';
import 'package:edu/src/domain/blocs/user_bloc/user_bloc.dart';
import 'package:edu/src/domain/entity/storage_repository.dart';
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
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            String accessToken =
                StorageRepository.getString(key: "access_token");
            if (accessToken.isEmpty) {
              context.go(Routes.signIn);
            } else {
              context.read<AllModulesBloc>().add(GetAllModules());
              context.read<UserBloc>().add(GetUserData());
              await Future.delayed(const Duration(seconds: 1), () {
                context.read<AllLessonsBloc>().add(
                      GetModuleLessonsEvent(
                          moduleId: context
                              .read<AllModulesBloc>()
                              .state
                              .allModules[0]
                              .moduleId),
                    );
              });
              if (!context.mounted) return;
              context.go(Routes.home);
            }
          });
        }
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/sscreen.png'),
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

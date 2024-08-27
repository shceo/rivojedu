import 'package:edu/rivojapp.dart';
import 'package:edu/src/domain/blocs/all_lessons_bloc/all_lessons_bloc.dart';
import 'package:edu/src/domain/blocs/all_modules_bloc/all_modules_bloc.dart';
import 'package:edu/src/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:edu/src/domain/blocs/nav_bloc/main_bloc.dart';
import 'package:edu/src/domain/blocs/splash_bloc/splash_screen_bloc.dart';
import 'package:edu/src/domain/blocs/top_users_bloc/top_users_bloc.dart';
import 'package:edu/src/domain/blocs/user_bloc/user_bloc.dart';
import 'package:edu/src/domain/entity/storage_repository.dart';
import 'package:edu/src/domain/remote/api_client.dart';
import 'package:edu/src/domain/repositories/all_lessons_repository.dart';
import 'package:edu/src/domain/repositories/all_modules_repository.dart';
import 'package:edu/src/domain/repositories/auth_repository.dart';
import 'package:edu/src/domain/repositories/top_users_repository.dart';
import 'package:edu/src/domain/repositories/users_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await StorageRepository.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings('@mipmap/ic_launcher');

  // const InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  // );

  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  ApiClient apiClient = ApiClient();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => AuthRepository(apiClient: apiClient)),
        RepositoryProvider(
            create: (context) => AllModulesRepository(apiClient: apiClient)),
        RepositoryProvider(
            create: (context) => AllLessonsRepository(apiClient: apiClient)),
        RepositoryProvider(
            create: (context) => UserRepository(apiClient: apiClient)),
        RepositoryProvider(
            create: (context) => TopUsersRepository(apiClient: apiClient)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MainBloc()),
          BlocProvider(create: (context) => SplashBloc()..add(AppStarted())),
          BlocProvider(
            create: (context) =>
                AuthBloc(repository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => AllModulesBloc(
                allModulesRepository: context.read<AllModulesRepository>()),
          ),
          BlocProvider(
            create: (context) => AllLessonsBloc(
                allLessonsRepository: context.read<AllLessonsRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                UserBloc(userRepository: context.read<UserRepository>()),
          ),
          BlocProvider(
            create: (context) => TopUsersBloc(
                topUsersRepository: context.read<TopUsersRepository>()),
          ),
        ],
        child: App(),
      ),
    ),
  );
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:edu/rivojapp.dart';
import 'package:edu/src/domain/blocs/nav_bloc/main_bloc.dart';
import 'package:edu/src/domain/blocs/splash_bloc/splash_screen_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  AwesomeNotifications().initialize;

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => MainBloc()),
      BlocProvider(create: (context) => SplashBloc()..add(AppStarted())),
    ],
    child: App(),
  ));
}

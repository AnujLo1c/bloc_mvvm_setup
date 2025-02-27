import 'package:bloc_setup/bloc/splash/splash_bloc.dart';
import 'package:bloc_setup/data/repository/google_auth_repository.dart';
import 'package:bloc_setup/data/repository/login_repository.dart';
import 'package:bloc_setup/res/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/google_auth/google_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers:[
        RepositoryProvider(create: (context) => GoogleAuthRepository()),
        RepositoryProvider(create: (context) => LoginRepository()),
      ] ,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SplashBloc()),
          BlocProvider(create: (context) => GoogleBloc(RepositoryProvider.of<GoogleAuthRepository>(context))),
          BlocProvider(create: (context) => LoginBloc(RepositoryProvider.of<LoginRepository>(context))),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bloc Setup',
          routes: AppRoutes.routes,
          initialRoute: "/splash",
        ),
      ),
    );
  }
}

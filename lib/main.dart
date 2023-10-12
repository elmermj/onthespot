import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_the_spot/blocs/auth/login/login_bloc.dart';
import 'package:on_the_spot/blocs/auth/register/register_bloc.dart';
import 'package:on_the_spot/blocs/home/home_bloc.dart';
import 'package:on_the_spot/firebase_options.dart';
import 'package:on_the_spot/network/repository/repository_store.dart';
import 'package:on_the_spot/views/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(authRepo: RepositoryStore.authRepository)),
        BlocProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(authRepo: RepositoryStore.authRepository)),
        BlocProvider<HomeBloc>(
            create: (context) =>
                HomeBloc(homeRepo: RepositoryStore.homeRepository)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
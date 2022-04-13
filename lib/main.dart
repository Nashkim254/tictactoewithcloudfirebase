import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/screens/highscore/cubit/scores_cubit.dart';
import 'package:tic_tac_toe/screens/home_screen/bloc/theme_bloc/bloc/theme_bloc.dart';
import 'package:tic_tac_toe/screens/home_screen/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tic_tac_toe/screens/login/login.dart';
import 'package:tic_tac_toe/screens/tournaments/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Theme Bloc to change between dark and light theme.
     providers:[ 
       BlocProvider(create: (context) => ThemeBloc(),) ,
      BlocProvider(create: (context)=> ScoresCubit())
     ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ChangeNotifierProvider<Teams>(
            create: (context) => Teams(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return  HomeScreen();
                  }
                  return Login();
                },
              ),
              theme: ThemeData(
                  brightness:
                      state is DarkTheme ? Brightness.dark : Brightness.light),
            ),
          );
        },
      ),
    );
  }
}

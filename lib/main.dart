import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mygym/src/bloc/event/session.event.dart';
import 'package:mygym/src/bloc/session.bloc.dart';
import 'package:mygym/src/bloc/set.bloc.dart';
import 'package:mygym/src/bloc/workout.bloc.dart';
import 'package:mygym/src/bloc/event/workout.event.dart';
import 'package:mygym/src/bloc/workout.shared.id.bloc.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:mygym/src/presentation/pages/workout.page.dart';
import 'package:mygym/src/presentation/pages/add.exercise.page.dart';
import 'package:mygym/src/presentation/pages/home.page.dart';
import 'package:mygym/src/presentation/pages/page1.dart';
import 'package:mygym/src/presentation/pages/page2.dart';
import 'package:mygym/src/presentation/pages/welcome.page.dart';
import 'package:provider/provider.dart';

void main() async {
  final appDatabase = AppDatabase();

  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: appDatabase),
        BlocProvider(create: (_) => WorkoutIdBloc()),
        BlocProvider(create: (_) => SessionBloc(appDatabase)),
        BlocProvider(
          create: (context) => WorkoutBloc(appDatabase)..add(LoadWorkouts()),
        ),
        BlocProvider<SetBloc>(
          create: (context) => SetBloc(appDatabase),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoCondensedTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const WelcomePage(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/workout': (context) => WorkoutPage(),
        '/add-exercise': (context) => AddExercisePage(),
        // Add more routes as needed
      },
    );
  }
}

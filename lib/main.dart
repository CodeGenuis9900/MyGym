import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mygym/src/data/repositories/DatabaseHelper.dart';
import 'package:mygym/src/data/repositories/DatabaseProvider.dart';
import 'package:mygym/src/presentation/pages/WorkoutPage.dart';
import 'package:mygym/src/presentation/pages/home.page.dart';
import 'package:mygym/src/presentation/pages/page1.dart';
import 'package:mygym/src/presentation/pages/page2.dart';
import 'package:mygym/src/presentation/pages/welcome.page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          DatabaseProvider(), // Provide an instance of your database provider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidebar Menu',
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
        // Add more routes as needed
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mygym/src/presentation/pages/WorkoutPage.dart';
import 'package:mygym/src/presentation/pages/homepage.dart';
import 'package:mygym/src/presentation/pages/page1.dart';
import 'package:mygym/src/presentation/pages/page2.dart';

void main() {
  runApp(const MyApp());
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
      home: MyHomePage(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/workout':(context) => WorkoutPage(),
        // Add more routes as needed
      },
    );
  }

}





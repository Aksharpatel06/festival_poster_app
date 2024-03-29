import 'package:festival_poster_app/view/homescreen/homescreen.dart';
import 'package:festival_poster_app/view/posterscreen/posterscreen.dart';
import 'package:festival_poster_app/view/spleshscreen/spleshscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/poster',
      routes: {
        '/':(context) => splesh_screen(),
        '/home':(context) => Home_screen(),
        '/poster':(context) => Poster_screen(),
      },
    );
  }
}
import 'package:festival_poster_app/view/editscreen/Editscreen.dart';
import 'package:festival_poster_app/view/historyscreen/store_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/':(context) => splesh_screen(),
        '/home':(context) => Home_screen(),
        '/poster':(context) => Poster_screen(),
        '/edit':(context) => Edit_screen(),
        '/history':(context) => History_screen(),
      },
    );
  }
}
import 'package:flutter/material.dart';

class Poster_screen extends StatefulWidget {
  const Poster_screen({super.key});

  @override
  State<Poster_screen> createState() => _Poster_screenState();
}

class _Poster_screenState extends State<Poster_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c2438),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

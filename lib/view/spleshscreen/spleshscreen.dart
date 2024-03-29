import 'dart:async';

import 'package:flutter/material.dart';

class splesh_screen extends StatefulWidget {
  const splesh_screen({super.key});

  @override
  State<splesh_screen> createState() => _splesh_screenState();
}

class _splesh_screenState extends State<splesh_screen> {
  
  @override
  Widget build(BuildContext context) {
    Timer(Duration(days: 5), () {
      Navigator.pushNamed(context, '/home');
    });
    return Scaffold(
      body: Center(
        child: Image.asset('asset/img/splesh_img.png'),
      ),
    );
  }
}

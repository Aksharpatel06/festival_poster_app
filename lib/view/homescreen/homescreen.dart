import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Festy',style: GoogleFonts.satisfy(fontWeight: FontWeight.w700,fontSize: 15,color: Colors.white),),
        backgroundColor: Color(0xff1c2438),
        actions: [
          Icon(Icons.grid_view,color: Colors.white,),
          SizedBox(width: 15,)
        ],
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}

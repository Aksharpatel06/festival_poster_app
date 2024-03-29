import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff1c2438),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(

            ),
          ),
          Container(
            height: 220,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Color(0xfffcbd05),
              borderRadius: BorderRadius.only(topLeft: Radius.elliptical(200,200),topRight: Radius.elliptical(200,200))
            ),
            child: Container(
              height: 180,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xff1d243b),
                  borderRadius: BorderRadius.only(topLeft: Radius.elliptical(200,200),topRight: Radius.elliptical(200,200))
              ),
              child:Column(
                children: [
                  SizedBox(height: 35,),
                  Text('Festi Vals',style: GoogleFonts.lobster(
                    fontSize: 35,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),),
                  SizedBox(height: 5,),
                  Text('Create Your Template With us!!',style: GoogleFonts.lobster(
                    fontSize: 15,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

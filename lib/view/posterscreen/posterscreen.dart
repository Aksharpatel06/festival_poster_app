import 'package:festival_poster_app/utils/global_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/festivallist.dart';
import '../../utils/text.dart';

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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff1c2438),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.5,
                            spreadRadius: 1,
                          )
                        ],
                      color: Colors.black,
                    ),
                    child: Image.asset(
                      festivalList[postviewIndex]['Images'],
                      fit: BoxFit.cover,
                    )),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 6;
                      isImageandColor =true;
                      txtname = TextEditingController(text:'');
                      textcolorindex=0;
                      textfontfamilyindex =0;
                      top =0;
                      bottem =0;
                      left =0;
                      right =0;
                      backgroundcolorindex == 0;
                      backgroungindex =0;
                    });
                    Navigator.of(context).pushNamed('/edit');
                  },
                  child: Container(
                    height: 60,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Edit Template',style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 220,
            alignment: Alignment.bottomRight,
            decoration: const BoxDecoration(
                color: Color(0xfffcbd05),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(200, 200),
                    topRight: Radius.elliptical(200, 200))),
            child: Container(
              height: 180,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xff1d243b),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(200, 200),
                      topRight: Radius.elliptical(200, 200))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    'FestiVals',
                    style: GoogleFonts.lobster(
                      fontSize: 35,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Create Your Template With us!!',
                    style: GoogleFonts.lobster(
                      fontSize: 15,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

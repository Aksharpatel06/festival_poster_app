import 'package:festival_poster_app/utils/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/festivallist.dart';

class History_screen extends StatefulWidget {
  const History_screen({super.key});

  @override
  State<History_screen> createState() => _History_screenState();
}

class _History_screenState extends State<History_screen> {

  @override
  void initState() {
    // TODO: implement initState
    print(history);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          shadowColor: const Color(0xff1c2438),
          centerTitle: true,
          title: Text(
            'Festy',
            style: GoogleFonts.lobster(
              fontSize: 35,
              color: Colors.black,
              letterSpacing: 2,
            ),
          ),
          backgroundColor: const Color(0xff1c2438),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: List.generate(history.length, (index) =>
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
               height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                  BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.5,
                  blurRadius: 1,
                ),],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: double.infinity,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        child: Image.file(history[index]['Image'],fit: BoxFit.cover,),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,
                        ),
                        Text('poster${index+1}.png',style: TextStyle(fontSize: 20),),
                        Text('${festivalList[history[index]['festival']]['Festival name']}',style: TextStyle(fontSize: 14),),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              history.removeAt(index);
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text('delete',style: TextStyle(fontSize: 20),),
                          ),
                        ),
                        SizedBox(height: 5,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

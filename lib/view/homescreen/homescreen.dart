import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/global_variable.dart';
import 'componet/List_View.dart';

import 'componet/grid_view.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          shadowColor: const Color(0xff1c2438),
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            'Festy',
            style: GoogleFonts.lobster(
              fontSize: 35,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          backgroundColor: const Color(0xff1c2438),
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  isfestival = !isfestival;
                });
              },
              child: Icon((!isfestival)?Icons.filter_list:
                Icons.grid_view,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed('/history').then((value) => setState(() {
                  }));
                });
              },
              child: Icon(Icons.save,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      body: Center(child: (isfestival)?List_view():Grid_View()),
    );
  }
}
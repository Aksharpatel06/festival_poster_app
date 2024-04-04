import 'package:flutter/material.dart';

import '../../../../utils/colorlist.dart';
import '../../../../utils/global_variable.dart';
Container backgroundcol() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xff1c2438),
    ),
    child: const Text(
      'BG Color',
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
Padding backcolors(int index) {
  return Padding(
    padding: const EdgeInsets.only(right: 18.0),
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
              spreadRadius: 1,
            )
          ],
          color: (index == 0) ? color : null,
          gradient: (index > 0)
              ? LinearGradient(colors: colorgrid[index])
              : null),
      child: (index == 0)
          ? const Icon(
        Icons.add,
        size: 50,
      )
          : null,
    ),
  );
}
Text headofbgcolor() {
  return Text(
    'Choose Background Color',
    style: TextStyle(color: Colors.white, fontSize: 15),
  );
}
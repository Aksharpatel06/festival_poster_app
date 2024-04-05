import 'package:flutter/material.dart';

import '../../../utils/colorlist.dart';
import '../../../utils/festivallist.dart';
import '../../../utils/global_variable.dart';
import '../../../utils/text.dart';

Column image() {
  return Column(
    children: [
      Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            boxShadow: [
              const BoxShadow(
                color: Colors.grey,
                blurRadius: 0.5,
                spreadRadius: 1,
              )
            ],
            color:
            (!isImageandColor && backgroundcolorindex == 0)
                ? color
                : null,
            gradient:
            (!isImageandColor && backgroundcolorindex > 0)
                ? LinearGradient(
              colors: colorgrid[backgroundcolorindex],
            )
                : null,
          ),
          child: Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: (isImageandColor)
                      ? Image.asset(
                    festivalList[postviewIndex]['image']
                    [backgroungindex],
                    fit: BoxFit.cover,
                  )
                      : null),
              Positioned(
                  top: top,
                  bottom: bottem,
                  left: left,
                  right: right,
                  child: Container(
                      height: 300,
                      width: 300,
                      child: Text(
                        txtname.text,
                        style: textfamily[textfontfamilyindex](
                            fontSize: fontofsize,
                            color: Colorlist[textcolorindex]),
                      )))
            ],
          ))
    ],
  );
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool isfestival = true;
int postviewIndex =0;
int editindex =0;
int backgroungindex =0;
int backgroundcolorindex =0;
bool isImageandColor =true;
Color color = Colors.white;
Color textcolor = Colors.black;
Uint8List? imgdata;

GlobalKey imgkey = GlobalKey();
List history =[];
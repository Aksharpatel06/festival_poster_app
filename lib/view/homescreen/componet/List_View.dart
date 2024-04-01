
import 'package:flutter/material.dart';

import '../../../utils/festivallist.dart';
import 'festival_Listview.dart';

ListView List_view() {
  return ListView.builder(
    itemBuilder:(context, index) => festival(festivalList[index]['Color'],festivalList[index]['Festival name'],festivalList[index]['Text'],festivalList[index]['Images'],index,context),
    itemCount: festivalList.length,
  );
}
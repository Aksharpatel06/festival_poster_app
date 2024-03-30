
import 'package:flutter/material.dart';

import '../../../utils/festivallist.dart';
import 'festival_Listview.dart';

ListView List_view(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    children: [
      SizedBox(height: 10,),
      ...List.generate(festivalList.length, (index) => festival(festivalList[index]['Color'],festivalList[index]['Festival name'],festivalList[index]['Text'],festivalList[index]['Images'],index,context)),
    ],
  );
}
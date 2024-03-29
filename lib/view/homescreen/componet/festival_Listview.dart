import 'dart:ui';

import 'package:flutter/material.dart';

Padding festival(Color color,String name,String name2,String img) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 270,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                  Text(name2,overflow: TextOverflow.clip,style: TextStyle(fontSize: 12,color: Colors.white),),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.white)
              ),
              child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.asset(img,fit: BoxFit.cover,)),
            ),
          )
        ],
      ),
    ),
  );
}
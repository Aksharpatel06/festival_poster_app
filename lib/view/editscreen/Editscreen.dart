import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/colorlist.dart';
import '../../utils/festivallist.dart';
import '../../utils/global_variable.dart';


class Edit_screen extends StatefulWidget {
  const Edit_screen({super.key});

  @override
  State<Edit_screen> createState() => _Edit_screenState();
}

class _Edit_screenState extends State<Edit_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff1c2438),
        title: Text(
          'Edit',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.5,
                            spreadRadius: 1,
                          )
                        ],
                          gradient:(!isImageandColor)? LinearGradient(
                              colors: colorgrid[backgroundcolorindex],
                          ):null,
                      ),
                      child:(isImageandColor)? Image.asset(
                        festivalList[postviewIndex]['image'][backgroungindex],
                        fit: BoxFit.cover,
                      ):null),
                ],
              ),
            ),
          ),
          IndexedStack(
            index: editindex,
            children: [
              Index_one(),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Color(0xff1c2438),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Edit Your Text Here!!',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
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
                          child: Text(
                            'Add Text',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 150,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
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
                          child: Text(
                            'Alignment',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
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
                          child: Text(
                            'Font Family',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 150,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
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
                          child: Text(
                            'Font Color',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                color: Colors.green,
              ),
              Container(
                height: 100,
                color: Colors.blue,
              ),
              Container(
                height: 220,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff1c2438),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose Background',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                editindex = 0;
                              });
                            },
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          festivalList[postviewIndex]['image'].length,
                          (index) => InkWell(
                            onTap: () {
                              setState(() {
                                isImageandColor = true;
                                backgroungindex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
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
                                    festivalList[postviewIndex]['image'][index],
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 220,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xff1c2438),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose Background Color',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                editindex = 0;
                              });
                            },
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          colorgrid.length,
                          (index) => InkWell(
                            onTap: () {
                              setState(() {
                                isImageandColor = false;
                                backgroundcolorindex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 0.5,
                                      spreadRadius: 1,
                                    )
                                  ],
                                 gradient: LinearGradient(
                                   colors: colorgrid[index]
                                 )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                  spreadRadius: 2,
                )
              ],
              color: Color(0xff1c2438),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.draw,
                        color: Colors.white,
                      ),
                      Text(
                        'Canvas',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.text_fields,
                        color: Colors.white,
                      ),
                      Text(
                        'Text',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.save_alt,
                        color: Colors.white,
                      ),
                      Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container Index_one() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Change Background Image And Color',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    editindex = 4;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
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
                  child: Text(
                    'Background',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editindex = 5;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
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
                  child: Text(
                    'BG Color',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

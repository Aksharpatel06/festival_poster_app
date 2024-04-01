import 'package:flutter/material.dart';
import '../../utils/festivallist.dart';
import '../../utils/global_variable.dart';
import 'componect/index_stack.dart';

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
                        color: Colors.black,
                      ),
                      child: Image.asset(
                        festivalList[postviewIndex]['Images'],
                        fit: BoxFit.cover,
                      )),
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
                    SizedBox(height: 15,),
                    Text('Edit Your Text Here!!',style: TextStyle(color: Colors.white,fontSize: 15),),
                    SizedBox(height:25,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width : 150,
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
                          child: Text('Add Text',style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                        Container(
                          width : 150,
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
                          child: Text('Alignment',style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width : 150,
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
                          child: Text('Font Family',style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                        Container(
                          width : 150,
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
                          child: Text('Font Color',style: TextStyle(color: Colors.white,fontSize: 20),),
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
}

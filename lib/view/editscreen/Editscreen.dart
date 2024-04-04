import 'package:festival_poster_app/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../utils/colorlist.dart';
import '../../utils/festivallist.dart';
import '../../utils/global_variable.dart';
import "package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart";
import 'componect/background/backcolor.dart';
import 'componect/background/backgroundimage.dart';
import 'componect/bottomnavigator.dart';
import 'componect/image.dart';
import 'componect/simple.dart';
import 'componect/text/addthetext/addtext.dart';
import 'componect/text/alignment/bottom.dart';
import 'componect/text/alignment/fontsize.dart';
import 'componect/text/alignment/left.dart';
import 'componect/text/alignment/rigth.dart';
import 'componect/text/alignment/simple.dart';
import 'componect/text/alignment/top.dart';
import 'componect/text/buttons.dart';
import 'componect/text/fontcolor/color.dart';
import 'componect/text/fontfamily/family.dart';

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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff1c2438),
        title: const Text(
          'Edit',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: RepaintBoundary(
                  key: imgkey,
                  child: image(),
                ),
              ),
            ),
          ),
          IndexedStack(
            index: editindex,
            children: [
              canvas(), //0
              text(), //1
              fontfamilys(), //2
              Container(
                height: 100,
                color: Colors.blue,
              ), //3
              background(), //4
              backgroundcolors(), //5
              Container(), //6
              alignment(), //7
              textfield(), //8
              textcolor() //9
            ],
          ),
        ],
      ),
      bottomNavigationBar: bottomnavigator(),
    );
  }

  Container textfield() {
    return Container(
      height: 230,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headtext(),
              InkWell(
                  onTap: () {
                    setState(() {
                      TextEditingControllerlist.add(txtname.text);
                      editindex = 1;
                    });
                  },
                  child: icons())
            ],
          ),
          dividerandspace(),
          textFields()
        ],
      ),
    );
  }
  Container fontfamilys() {
    return Container(
      height: 230,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              familyheadtext(),
              InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 1;
                    });
                  },
                  child: icons())
            ],
          ),
          dividerandspace(),
          Container(
            height: 144,
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(
                      textfamily.length,
                      (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  textfontfamilyindex = index;
                                });
                              },
                              child: fontfamilytext(index),
                            ),
                          ))),
            ),
          )
        ],
      ),
    );
  }
  Container textcolor() {
    return Container(
      height: 230,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headfontcolor(),
              InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 1;
                    });
                  },
                  child: icons())
            ],
          ),
          dividerandspace(),
          GridView.builder(
            itemCount: Colorlist.length,
            physics: PageScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  textcolorindex = index;
                  (index == 0)
                      ? showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text('Pick your color'),
                                content: Container(
                                  height: 500,
                                  width: 300,
                                  child: ColorPicker(
                                    color: Colorlist[0],
                                    onChanged: (value) {
                                      setState(() {
                                        Colorlist[0] = value;
                                      });
                                    },
                                    initialPicker: Picker.paletteHue,
                                  ),
                                ),
                                actions: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("save"))
                                ],
                              ))
                      : null;
                });
              },
              child: coloricon(index),
            ),
          )
        ],
      ),
    );
  }
  Container alignment() {
    return Container(
      height: 230,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headofalignments(),
              InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 1;
                    });
                  },
                  child: icons())
            ],
          ),
          dividerandspace(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    headofpostion(),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          bottem += 4;
                          top -= 4;
                        });
                      },
                      child: alignmenttop(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              right += 4;
                              left -= 4;
                            });
                          },
                          child: alignmentleft(),
                        ),
                        SizedBox(
                          width: 38,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              right -= 4;
                              left += 4;
                            });
                          },
                          child: alignmentrigth(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          top += 4;
                          bottem -= 4;
                        });
                      },
                      child: alignmentbottom(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fontsizetext(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              fontofsize++;
                            });
                          },
                          child: fontsizeincrease(),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              fontofsize--;
                            });
                          },
                          child: fontsizereduce(),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Container backgroundcolors() {
    return Container(
      height: 230,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              headofbgcolor(),
              InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 0;
                    });
                  },
                  child: icons())
            ],
          ),
          const SizedBox(
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
                      (index == 0)
                          ? showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Pick your color'),
                                    content: Container(
                                      height: 500,
                                      width: 300,
                                      child: ColorPicker(
                                        color: color,
                                        onChanged: (value) {
                                          setState(() {
                                            color = value;
                                            backgroundcolorindex = index;
                                            isImageandColor = false;
                                          });
                                        },
                                        initialPicker: Picker.paletteHue,
                                      ),
                                    ),
                                    actions: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("save"))
                                    ],
                                  ))
                          : null;
                    });
                  },
                  child: backcolors(index),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Container background() {
    return Container(
      height: 230,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               headofimage(),
              InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 0;
                    });
                  },
                  child: icons())
            ],
          ),
          const SizedBox(
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
                  child: backimage(index),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Container text() {
    return Container(
      height: 230,
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          headoftext(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    editindex = 8;
                  });
                },
                child: addtext(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editindex = 7;
                  });
                },
                child: alignment(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    editindex = 2;
                  });
                },
                child: fontfamily(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editindex = 9;
                  });
                },
                child: fontcolor(),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Container canvas() {
    return Container(
      height: 230,
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          textname(),
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
                child: backgroundimg(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editindex = 5;
                  });
                },
                child: backgroundcol(),
              ),
            ],
          )
        ],
      ),
    );
  }
  Container bottomnavigator() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            spreadRadius: 0.5,
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
            child: canvasedit(),
          ),
          InkWell(
            onTap: () {
              setState(() {
                editindex = 1;
              });
            },
            child: textedit(),
          ),
          save(),
          share(),
        ],
      ),
    );
  }
}

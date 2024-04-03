import 'dart:io';

import 'package:festival_poster_app/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import '../../utils/colorlist.dart';
import '../../utils/festivallist.dart';
import '../../utils/global_variable.dart';
import "package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart";
import 'dart:ui' as ui;

class Edit_screen extends StatefulWidget {
  const Edit_screen({super.key});

  @override
  State<Edit_screen> createState() => _Edit_screenState();
}
GlobalKey imgkey = GlobalKey();
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
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
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
                            color: (!isImageandColor && backgroundcolorindex == 0)
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
                                        style: TextStyle(
                                            fontSize: fontofsize,
                                            color: Colorlist[textcolorindex]),
                                      )))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          IndexedStack(
            index: editindex,
            children: [
              canvas(), //0
              text(), //1
              Container(
                height: 100,
                color: Colors.green,
              ), //2
              Container(
                height: 100,
                color: Colors.blue,
              ), //3
              background(), //4
              backgroundcolors(), //5
              Container(), //6
              alignment(), //7
              Container(
                height: 220,
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
                        const Text(
                          'Edit Your Text',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                TextEditingControllerlist.add(txtname.text);
                                editindex = 1;
                              });
                            },
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      controller: txtname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )),
                    )
                  ],
                ),
              ), //8
              Container(
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
                        const Text(
                          'Edit Your Text color',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                editindex = 1;
                              });
                            },
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GridView.builder(
                      itemCount: Colorlist.length,
                      physics: PageScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colorlist[index]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ) //9
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,

        unselectedLabelStyle: TextStyle(color: Colors.white),
        items: [
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 0;
                    });
                  },
                  child: Icon(Icons.draw)),
              label: 'Canvas',backgroundColor: Color(0xff1c2438),),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 1;
                    });
                  },
                  child: Icon(Icons.text_fields)),
              label: 'Text'),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () async{

                      RenderRepaintBoundary? boundray = imgkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                      ui.Image image = await boundray.toImage();
                      ByteData? bytedata = await image.toByteData(format: ui.ImageByteFormat.png);
                      imgdata = bytedata!.buffer.asUint8List();
                      ImageGallerySaver.saveImage(imgdata!,name: 'poster',quality: 100);
                  },
                  child: Icon(Icons.share)),
              label: 'Share'),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () async{
                    final directory =await getApplicationDocumentsDirectory();
                    File fileImage = await File('${directory.path}/img.png').create();
                    fileImage.writeAsBytesSync(imgdata!);
                    await ShareExtend.share(fileImage.path, 'festival');
                  },
                  child: Icon(Icons.save_alt)),
              label: 'Save'),
        ],
      ),
    );
  }

  Container alignment() {
    return Container(
      height: 220,
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
              const Text(
                'Edit Your Font Style',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 1;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Alignament',
                      style: TextStyle(color: Colors.white),
                    ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 1,
                                spreadRadius: 0.5,
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xff1c2438),
                          ),
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                          child: Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 0.5,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xff1c2438),
                            ),
                            child: Icon(
                              Icons.arrow_left_sharp,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
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
                          child: Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 0.5,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xff1c2438),
                            ),
                            child: Icon(
                              Icons.arrow_right,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 1,
                                spreadRadius: 0.5,
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xff1c2438),
                          ),
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 38.0),
                      child: Text(
                        'Font size',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
                          child: Container(
                            width: 40,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 0.5,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xff1c2438),
                            ),
                            child: Text(
                              'A+',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
                          child: Container(
                            width: 40,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 0.5,
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color(0xff1c2438),
                            ),
                            child: Text(
                              'A-',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
      height: 220,
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
              const Text(
                'Choose Background Color',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 0;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ))
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
                  child: Padding(
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
                  ),
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
      height: 220,
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
              const Text(
                'Choose Background',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      editindex = 0;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ))
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
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
    );
  }

  Container text() {
    return Container(
      height: 220,
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
          const Text(
            'Edit Your Text Here!!',
            style: TextStyle(color: Colors.white, fontSize: 15),
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
                    editindex = 8;
                  });
                },
                child: Container(
                  width: 130,
                  alignment: Alignment.center,
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
                    'Add Text',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editindex = 7;
                  });
                },
                child: Container(
                  width: 130,
                  alignment: Alignment.center,
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
                    'Alignment',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                alignment: Alignment.center,
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
                  'Font Family',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editindex = 9;
                  });
                },
                child: Container(
                  width: 130,
                  alignment: Alignment.center,
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
                    'Font Color',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container canvas() {
    return Container(
      height: 220,
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
          const Text(
            'Change Background Image And Color',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
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
                ),
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
            child: const Column(
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
            child: const Column(
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
            child: const Column(
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
            child: const Column(
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
    );
  }
}

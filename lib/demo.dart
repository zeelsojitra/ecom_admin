import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'common_screen/Comman_Container.dart';
import 'common_screen/Comman_TeextFiled.dart';
import 'common_screen/Comman_text.dart';
import 'globle/media_query.dart';

class Demp extends StatefulWidget {
  const Demp({Key? key}) : super(key: key);

  @override
  State<Demp> createState() => _DempState();
}

class _DempState extends State<Demp> {
  final globalKey = GlobalKey<ScaffoldState>();
  ImagePicker picker = ImagePicker();
  File? image;
  List<Uint8List>? imafeFileList = [];
  void selectedImages() async {
    final List<XFile>? selectedImges = await picker.pickMultiImage();

    selectedImges!.forEach((element) async {
      imafeFileList!.add(await element.readAsBytes());
      setState(() {});

      print("Image List=>>${imafeFileList}");
    });

    print("Image print length :" + imafeFileList!.length.toString());
    setState(() {});
  }

  PickImage(ImageSource imageSource) async {
    final file = await picker.pickImage(source: imageSource);

    if (file != null) {
      setState(() {
        image = File(file.path);
      });
    }
  }

  List menu = [
    {
      "name": "Home",
    },
    {
      "name": "Dashboard",
    },
    {
      "name": "category",
    },
    {
      "name": "Products",
    },
    {
      "name": "Inner Products",
    },
    {
      "name": "order",
    },
    {
      "name": "settings",
    },
    {
      "name": "Logout",
    },
  ];
  List colorr = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purpleAccent,
    Colors.amberAccent,
    Colors.tealAccent,
  ];
  List sizee = [
    "XXS",
    "XS",
    "S",
    "M",
    "L",
    "XL",
  ];
  int selected = 0;
  int size_selected = 0;
  final product_name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: width(context),
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height(context),
                    width: width(context) * 0.20,
                  ),
                  Container(
                    height: height(context),
                    width: width(context) * 0.80,
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height(context) * 0.05,
                            ),
                            // Center(
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       selectedImages();
                            //     },
                            //     child: Container(
                            //       color: Colors.grey.shade300,
                            //       height: 200,
                            //       width: 200,
                            //       child: Icon(Icons.add),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: height(context) * 0.1,
                            // ),
                            SizedBox(
                              width: width(context),
                              child: Row(
                                children: [
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        selectedImages();
                                      },
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        height: 150,
                                        width: 150,
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: height(context) * 0.2,
                                      width: width(context) * 0.2,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: imafeFileList!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Image.memory(
                                              imafeFileList![index],
                                              height: height(context) * 0.05,
                                              width: width(context) * 0.05,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: height(context) * 0.1,
                            ),
                            Comman_TexxtFiled(
                              enabledBorder: OutlineInputBorder(),
                              focouseborder: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(),
                              disableborder: OutlineInputBorder(),
                              FocusedErrorBorder: OutlineInputBorder(),
                              hinttext: "Enter Product Name",
                              sufficicon: product_name.text.length >= 2
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.orange,
                                    )
                                  : SizedBox(),
                            ),
                            SizedBox(
                              height: height(context) * 0.035,
                            ),
                            Comman_TexxtFiled(
                              enabledBorder: OutlineInputBorder(),
                              focouseborder: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(),
                              disableborder: OutlineInputBorder(),
                              FocusedErrorBorder: OutlineInputBorder(),
                              hinttext: "Enter Product Detail's",
                              sufficicon: product_name.text.length >= 2
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.orange,
                                    )
                                  : SizedBox(),
                            ),
                            SizedBox(
                              height: height(context) * 0.035,
                            ),
                            Comman_TexxtFiled(
                              enabledBorder: OutlineInputBorder(),
                              focouseborder: OutlineInputBorder(),
                              errorBorder: OutlineInputBorder(),
                              disableborder: OutlineInputBorder(),
                              FocusedErrorBorder: OutlineInputBorder(),
                              hinttext: "Enter Category Name",
                              sufficicon: product_name.text.length >= 2
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.orange,
                                    )
                                  : SizedBox(),
                            ),
                            SizedBox(
                              height: height(context) * 0.035,
                            ),
                            Text(
                              "Colors",
                              style: TextStyle(
                                fontSize: height(context) * 0.04,
                              ),
                            ),
                            SizedBox(
                              height: height(context) * 0.035,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  7,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selected = index;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: selected == index
                                                  ? Colors.amber
                                                  : Colors.transparent,
                                              width: width(context) * 0.003,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor: colorr[index],
                                            ),
                                          ),
                                        ),
                                      )),
                            ),
                            SizedBox(
                              height: height(context) * 0.035,
                            ),
                            Text(
                              "Sizes",
                              style: TextStyle(
                                fontSize: height(context) * 0.04,
                              ),
                            ),
                            SizedBox(
                              height: height(context) * 0.035,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  6,
                                  (index) => Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                size_selected = index;
                                              });
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: size_selected == index
                                                      ? Color(0xff95D5B2)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color:
                                                          Colors.grey.shade300),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Text(
                                                sizee[index],
                                                style: TextStyle(
                                                    color:
                                                        size_selected == index
                                                            ? Colors.white
                                                            : Colors.black),
                                              )),
                                            ),
                                          ),
                                        ],
                                      )),
                            ),
                            SizedBox(
                              height: height(context) * 0.040,
                            ),
                            Comman_Container(
                              BorderRadius: BorderRadius.circular(40),
                              height: height(context) * 0.07,
                              width: double.infinity,
                              ontap: () {},
                              color: Color(0xff95D5B2),
                              child: Center(
                                child: Comman_Text(
                                  fontsize: height(context) * 0.04,
                                  text: "Results (186)",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height(context) * 0.035,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

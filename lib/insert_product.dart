import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin/view/chart.dart';
import 'package:ecom_admin/view/inner_product.dart';
import 'package:ecom_admin/view/product_sreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'common_screen/Comman_TeextFiled.dart';
import 'common_screen/Comman_text.dart';
import 'controller/Pickmultipull_image.dart';
import 'controller/drawer_controller.dart';
import 'globle/media_query.dart';

class Insert_Product extends StatefulWidget {
  @override
  State<Insert_Product> createState() => _Insert_ProductState();
}

class _Insert_ProductState extends State<Insert_Product> {
  final globalKey = GlobalKey<ScaffoldState>();

  drawer_contoller countercontroller = Get.put(drawer_contoller());
  pickmultiImage image = Get.put(pickmultiImage());
  FirebaseAuth wfirebaseAuth = FirebaseAuth.instance;
  FirebaseStorage wfirebaseStorage = FirebaseStorage.instance;
  List menu = [
    {
      "name": "Home",
      "icon": Icons.home,
    },
    {
      "name": "Analytics",
      "icon": Icons.analytics_outlined,
    },
    {
      "name": "Users",
      "icon": Icons.supervised_user_circle_sharp,
    },
    {
      "name": "User Profile",
      "icon": Icons.person,
    },
    {
      "name": "Account",
      "icon": Icons.account_box,
    },
    {
      "name": "Product",
      "icon": Icons.production_quantity_limits,
    },
    {
      "name": "Inner Product",
      "icon": Icons.shopping_cart,
    },
    {
      "name": "order",
      "icon": Icons.delivery_dining,
    },
    {
      "name": "LogOut",
      "icon": Icons.logout,
    },
    {
      "name": "Logout",
      "icon": Icons.logout,
    },
  ];
  // List colorr = [
  //   Colors.black,
  //   Colors.red,
  //   Colors.green,
  //   Colors.blue,
  //   Colors.purpleAccent,
  //   Colors.amberAccent,
  //   Colors.tealAccent,
  // ];
  // List sizee = [
  //   "XXS",
  //   "XS",
  //   "S",
  //   "M",
  //   "L",
  //   "XL",
  // ];

  final product_name = TextEditingController();
  final product_stock = TextEditingController();
  final product_detils = TextEditingController();
  final product_catagory = TextEditingController();
  final product_price = TextEditingController();
  File? imagee;
  Uint8List? pickImage;

  ImagePicker picker = ImagePicker();

  void PickImage(ImageSource imageSource) async {
    final file = await picker.pickImage(source: imageSource);

    if (file != null) {
      pickImage = await file.readAsBytes();

      setState(() {});
    }
  }

  Future<String?> uploadImage(Uint8List bytes) async {
    final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
    Reference ref = _firebaseStorage
        .ref(
            "product/${FirebaseAuth.instance.currentUser!.uid}/${product_catagory.text}")
        .child('${DateTime.now()}.png');
    UploadTask uploadTask =
        ref.putData(bytes, SettableMetadata(contentType: 'image/png'));
    TaskSnapshot taskSnapshot = await uploadTask
        .whenComplete(() => print('done'))
        .catchError((error) => print('something went wrong'));
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  // Future<String?> uploadUserImage() async {
  //   try {
  //     await FirebaseStorage.instance
  //         .ref('${product_name.text}')
  //         .putFile(imagee!);
  //
  //     final url = await FirebaseStorage.instance
  //         .ref('${product_name.text}')
  //         .getDownloadURL();
  //     return url;
  //   } on FirebaseException catch (e) {
  //     print('FIREBASE STORAGE===>>${e.message}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            globalKey.currentState!.openDrawer();
          },
          child: Icon(Icons.menu),
        ),
        title: Text("E-Commerce Admin-panel"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height(context) - 56,
            width: width(context),
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height(context) * 0.8,
                    width: width(context) * 0.18,
                    color: Colors.white,
                    child: Column(children: [
                      SizedBox(
                        height: height(context) * 0.05,
                      ),
                      Image.asset("asserts/image/img.png", fit: BoxFit.cover),
                      SizedBox(
                        height: height(context) * 0.05,
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: menu.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                print("${image.selected.value}");
                                image.selected.value = index;
                              },
                              title: Text(menu[index]['name']),
                              leading: Icon(menu[index]['icon']),
                            );
                          },
                        ),
                      ),
                    ]),
                  ),
                  GetBuilder<pickmultiImage>(
                    builder: (controller) {
                      return Obx(
                        () => Container(
                          height: height(context),
                          width: width(context) * 0.82,
                          color: Color(0xffECECEC),
                          child: image.selected == 1
                              ? ChartScreen()
                              : image.selected == 2
                                  ? Center(child: Text("User"))
                                  : image.selected == 3
                                      ? Center(child: Text("User Profile"))
                                      : image.selected == 4
                                          ? Center(child: Text("Account"))
                                          : image.selected == 5
                                              ? Product_Screen()
                                              : image.selected == 6
                                                  ? Inner_Product()
                                                  : image.selected == 7
                                                      ? Center(
                                                          child: Text("Oder"))
                                                      : image.selected == 8
                                                          ? Center(
                                                              child: Text(
                                                                  "Setting"),
                                                            )
                                                          : Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      25),
                                                              child: Form(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SizedBox(
                                                                        height: height(context) *
                                                                            0.05,
                                                                      ),
                                                                      SizedBox(
                                                                        width: width(
                                                                            context),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Center(
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  PickImage(ImageSource.gallery);
                                                                                },
                                                                                child: Container(
                                                                                  color: Colors.grey.shade300,
                                                                                  height: 150,
                                                                                  width: 150,
                                                                                  child: Icon(Icons.add),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              child: pickImage == null
                                                                                  ? Icon(Icons.camera)
                                                                                  : Image.memory(
                                                                                      pickImage!,
                                                                                    ),
                                                                              height: 150,
                                                                              width: 150,
                                                                              color: Colors.grey,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: height(context) *
                                                                            0.035,
                                                                      ),
                                                                      Text(
                                                                        "Product Detail's",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              height(context) * 0.03,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: height(context) *
                                                                            0.035,
                                                                      ),
                                                                      Comman_TexxtFiled(
                                                                        controller:
                                                                            product_name,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(),
                                                                        focouseborder:
                                                                            OutlineInputBorder(),
                                                                        errorBorder:
                                                                            OutlineInputBorder(),
                                                                        disableborder:
                                                                            OutlineInputBorder(),
                                                                        FocusedErrorBorder:
                                                                            OutlineInputBorder(),
                                                                        hinttext:
                                                                            "Enter Product Name",
                                                                        sufficicon: product_name.text.length >=
                                                                                2
                                                                            ? Icon(
                                                                                Icons.check_circle,
                                                                                color: Colors.orange,
                                                                              )
                                                                            : SizedBox(),
                                                                      ),
                                                                      SizedBox(
                                                                        height: height(context) *
                                                                            0.035,
                                                                      ),
                                                                      Comman_TexxtFiled(
                                                                        controller:
                                                                            product_detils,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(),
                                                                        focouseborder:
                                                                            OutlineInputBorder(),
                                                                        errorBorder:
                                                                            OutlineInputBorder(),
                                                                        disableborder:
                                                                            OutlineInputBorder(),
                                                                        FocusedErrorBorder:
                                                                            OutlineInputBorder(),
                                                                        hinttext:
                                                                            "Enter Product Detail's",
                                                                        sufficicon: product_detils.text.length >=
                                                                                2
                                                                            ? Icon(
                                                                                Icons.check_circle,
                                                                                color: Colors.orange,
                                                                              )
                                                                            : SizedBox(),
                                                                      ),
                                                                      SizedBox(
                                                                        height: height(context) *
                                                                            0.035,
                                                                      ),
                                                                      Comman_TexxtFiled(
                                                                        controller:
                                                                            product_catagory,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(),
                                                                        focouseborder:
                                                                            OutlineInputBorder(),
                                                                        errorBorder:
                                                                            OutlineInputBorder(),
                                                                        disableborder:
                                                                            OutlineInputBorder(),
                                                                        FocusedErrorBorder:
                                                                            OutlineInputBorder(),
                                                                        hinttext:
                                                                            "Enter Category Name",
                                                                        sufficicon: product_catagory.text.length >=
                                                                                2
                                                                            ? Icon(
                                                                                Icons.check_circle,
                                                                                color: Colors.orange,
                                                                              )
                                                                            : SizedBox(),
                                                                      ),
                                                                      SizedBox(
                                                                        height: height(context) *
                                                                            0.035,
                                                                      ),
                                                                      Comman_TexxtFiled(
                                                                        controller:
                                                                            product_price,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(),
                                                                        focouseborder:
                                                                            OutlineInputBorder(),
                                                                        errorBorder:
                                                                            OutlineInputBorder(),
                                                                        disableborder:
                                                                            OutlineInputBorder(),
                                                                        FocusedErrorBorder:
                                                                            OutlineInputBorder(),
                                                                        hinttext:
                                                                            "Enter Price",
                                                                        sufficicon: product_price.text.length >=
                                                                                2
                                                                            ? Icon(
                                                                                Icons.check_circle,
                                                                                color: Colors.orange,
                                                                              )
                                                                            : SizedBox(),
                                                                      ),
                                                                      SizedBox(
                                                                        height: height(context) *
                                                                            0.035,
                                                                      ),
                                                                      Comman_TexxtFiled(
                                                                        enabledBorder:
                                                                            OutlineInputBorder(),
                                                                        focouseborder:
                                                                            OutlineInputBorder(),
                                                                        errorBorder:
                                                                            OutlineInputBorder(),
                                                                        disableborder:
                                                                            OutlineInputBorder(),
                                                                        FocusedErrorBorder:
                                                                            OutlineInputBorder(),
                                                                        controller:
                                                                            product_stock,
                                                                        validator:
                                                                            (p0) {
                                                                          if (p0!
                                                                              .isEmpty) {
                                                                            return "Please Enter Stock";
                                                                          }
                                                                        },
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        hinttext:
                                                                            "Enter Product Stock",
                                                                      ),
                                                                      SizedBox(
                                                                        height: height(context) *
                                                                            0.035,
                                                                      ),
                                                                      // Text(
                                                                      //   "Colors",
                                                                      //   style:
                                                                      //       TextStyle(
                                                                      //     fontSize:
                                                                      //         height(context) * 0.03,
                                                                      //   ),
                                                                      // ),
                                                                      // SizedBox(
                                                                      //   height:
                                                                      //       height(context) * 0.035,
                                                                      // ),
                                                                      // Row(
                                                                      //   mainAxisAlignment:
                                                                      //       MainAxisAlignment.spaceEvenly,
                                                                      //   children: List.generate(
                                                                      //       7,
                                                                      //       (index) => GestureDetector(
                                                                      //             onTap: () {
                                                                      //               image.Color.value = index;
                                                                      //             },
                                                                      //             child: Container(
                                                                      //               decoration: BoxDecoration(
                                                                      //                 shape: BoxShape.circle,
                                                                      //                 border: Border.all(
                                                                      //                   color: image.Color.value == index ? Colors.amber : Colors.transparent,
                                                                      //                   width: width(context) * 0.003,
                                                                      //                 ),
                                                                      //               ),
                                                                      //               child: Padding(
                                                                      //                 padding: EdgeInsets.all(4.0),
                                                                      //                 child: CircleAvatar(
                                                                      //                   radius: 15,
                                                                      //                   backgroundColor: colorr[index],
                                                                      //                 ),
                                                                      //               ),
                                                                      //             ),
                                                                      //           )),
                                                                      // ),
                                                                      // SizedBox(
                                                                      //   height:
                                                                      //       height(context) * 0.035,
                                                                      // ),
                                                                      // Text(
                                                                      //   "Sizes",
                                                                      //   style:
                                                                      //       TextStyle(
                                                                      //     fontSize:
                                                                      //         height(context) * 0.03,
                                                                      //   ),
                                                                      // ),
                                                                      // SizedBox(
                                                                      //   height:
                                                                      //       height(context) * 0.035,
                                                                      // ),
                                                                      // Row(
                                                                      //   mainAxisAlignment:
                                                                      //       MainAxisAlignment.spaceEvenly,
                                                                      //   children:
                                                                      //       List.generate(
                                                                      //     6,
                                                                      //     (index) =>
                                                                      //         Row(
                                                                      //       children: [
                                                                      //         GestureDetector(
                                                                      //           onTap: () {
                                                                      //             image.size_selected.value = index;
                                                                      //           },
                                                                      //           child: Container(
                                                                      //             height: 40,
                                                                      //             width: 40,
                                                                      //             decoration: BoxDecoration(color: image.size_selected.value == index ? Color(0xff95D5B2) : Colors.white, border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)),
                                                                      //             child: Center(
                                                                      //               child: Text(
                                                                      //                 sizee[index],
                                                                      //                 style: TextStyle(color: image.size_selected.value == index ? Colors.white : Colors.black),
                                                                      //               ),
                                                                      //             ),
                                                                      //           ),
                                                                      //         ),
                                                                      //       ],
                                                                      //     ),
                                                                      //   ),
                                                                      // ),
                                                                      MaterialButton(
                                                                        height: height(context) *
                                                                            0.07,
                                                                        onPressed:
                                                                            () async {
                                                                          final imageUrl =
                                                                              await uploadImage(pickImage!);
                                                                          print(
                                                                              "imag url${imageUrl}");
                                                                          print(
                                                                              "tapp");
                                                                          DocumentReference
                                                                              docRef =
                                                                              FirebaseFirestore.instance.collection("Product").doc();
                                                                          docRef
                                                                              .set({
                                                                            "image":
                                                                                imageUrl ?? '',
                                                                            "product_name":
                                                                                "${product_name.text}",
                                                                            "product_catagory":
                                                                                "${product_catagory.text}",
                                                                            "product_details":
                                                                                "${product_detils.text}",
                                                                            "product_price":
                                                                                "${product_price.text}",
                                                                            "product_stock":
                                                                                "${product_stock.text}",
                                                                            "seller_id":
                                                                                FirebaseAuth.instance.currentUser!.uid,
                                                                            "product_id":
                                                                                docRef.id,
                                                                          }).then((value) {
                                                                            {
                                                                              print("Success");
                                                                              product_name.clear();
                                                                              product_stock.clear();
                                                                              product_catagory.clear();
                                                                              product_detils.clear();
                                                                              product_price.clear();
                                                                            }
                                                                          }).catchError(
                                                                            (error) {
                                                                              print("an error occured${error}");
                                                                            },
                                                                          );
                                                                        },
                                                                        color: Color(
                                                                            0xff95D5B2),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Comman_Text(
                                                                            fontsize:
                                                                                height(context) * 0.04,
                                                                            text:
                                                                                "Results (186)",
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height: height(context) *
                                                                            0.035,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),

      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       DrawerHeader(
      //         padding: EdgeInsets.zero,
      //         child: UserAccountsDrawerHeader(
      //           currentAccountPicture: ClipOval(
      //             child: Comman_Container(
      //               height: 20,
      //               width: 40,
      //               color: Colors.grey,
      //             ),
      //           ),
      //           decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //                 colors: [Color(0xff2D6A4F), Color(0xff95D5B2)]),
      //           ),
      //           accountName: Comman_Text(
      //             text: "Profile Image",
      //           ),
      //           accountEmail: Comman_Text(
      //             text: "Zeel Sojitra",
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: Padding(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //           child: Column(
      //             children: List.generate(
      //               5,
      //               (index) => Comman_Container(
      //                 margin: EdgeInsets.only(
      //                   top: 10,
      //                 ),
      //                 BorderRadius: BorderRadius.circular(10),
      //                 height: height(context) * 0.1,
      //                 width: width(context),
      //                 color: Colors.grey,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

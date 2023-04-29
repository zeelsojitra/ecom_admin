import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../common_screen/Comman_text.dart';
import '../common_screen/variable.dart';

class ProductDetilsScreen extends StatefulWidget {
  final String image, name, price, category, details, stock;

  const ProductDetilsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
    required this.details,
    required this.stock,
  });
  @override
  State<ProductDetilsScreen> createState() => _ProductDetilsScreenState();
}

class _ProductDetilsScreenState extends State<ProductDetilsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Product")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 400,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Image.network(
                                      widget.image,
                                      // height: height(context) / 3,
                                      // width: width(context) / 2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Comman_Text(
                                      text: "Product Name :",
                                      color: Colors.black,
                                      fontsize: 15,
                                      fontweight: FontWeight.w400,
                                      fontFamily: "JB1",
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Comman_Text(
                                        text: "${widget.name}",
                                        color: grey,
                                        fontsize: 15,
                                        fontFamily: "JM1",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Comman_Text(
                                      text: "Rs :",
                                      color: Colors.black,
                                      fontsize: 15,
                                      fontweight: FontWeight.w400,
                                      fontFamily: 'JB1',
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Comman_Text(
                                      text: "${widget.price}₹",
                                      color: Colors.red,
                                      fontsize: 15,
                                      fontweight: FontWeight.w400,
                                      fontFamily: 'JM1',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Comman_Text(
                                      text: "Category:",
                                      color: Colors.black,
                                      fontsize: 15,
                                      fontweight: FontWeight.w400,
                                      fontFamily: 'JB1',
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Comman_Text(
                                      text: "${widget.category}",
                                      color: grey,
                                      fontsize: 15,
                                      fontweight: FontWeight.w400,
                                      fontFamily: 'JM1',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Comman_Text(
                                      text: "Stock:",
                                      color: Colors.black,
                                      fontsize: 15,
                                      fontweight: FontWeight.w400,
                                      fontFamily: 'JB1',
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Comman_Text(
                                      text: "${widget.stock}",
                                      color: grey,
                                      fontsize: 15,
                                      fontweight: FontWeight.w400,
                                      fontFamily: 'JM1',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Comman_Text(
                                      text: "Product Descripation :",
                                      color: black,
                                      fontsize: 15,
                                      fontweight: FontWeight.w400,
                                      fontFamily: 'JB1',
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Comman_Text(
                                      text: "${widget.details}",
                                      color: grey,
                                      fontsize: 15,
                                      fontweight: FontWeight.w400,
                                      fontFamily: "JM1",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

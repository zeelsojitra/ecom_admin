import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_screen/Comman_Container.dart';
import '../common_screen/Comman_text.dart';
import '../common_screen/variable.dart';

import 'Product_Detils.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Product")
          .where("seller_id",
              isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        print("find lenghth${snapshot.data!.docs.length}");
        return snapshot.data!.docs.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index];
                    //print("numberofoder${snapshot.data?.docs.length}");
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetilsScreen(
                                  image: data['image'],
                                  category: data["product_catagory"],
                                  details: data["product_details"],
                                  name: data["product_name"],
                                  price: data["product_price"],
                                  stock: data["product_stock"],
                                ),
                              ));
                        },
                        child: Card(
                          elevation: 5,
                          color: Colors.grey.shade200,
                          child: Comman_Container(
                            height: 140,
                            width: 120,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Comman_Container(
                                    height: 140,
                                    width: 80,
                                    BorderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(data["image"]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Comman_Text(
                                            text: "Product Name:",
                                            color: black,
                                            fontsize: 12,
                                            fontFamily: "JB1",
                                            fontweight: FontWeight.bold),
                                        Comman_Text(
                                          text: "${data["product_name"]}",
                                          color: grey,
                                          fontsize: 12,
                                          fontFamily: "JM1",
                                          fontweight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Comman_Text(
                                          text: "Product Categaroy:",
                                          color: black,
                                          fontsize: 12,
                                          fontFamily: "JB1",
                                          fontweight: FontWeight.bold,
                                        ),
                                        Comman_Text(
                                          text: "${data["product_catagory"]}",
                                          color: grey,
                                          fontsize: 12,
                                          fontFamily: "JM1",
                                          fontweight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Comman_Text(
                                          text: "Product Price:",
                                          color: black,
                                          fontsize: 12,
                                          fontFamily: "JB1",
                                          fontweight: FontWeight.bold,
                                        ),
                                        Comman_Text(
                                          text: "₹${data["product_price"]}",
                                          color: red,
                                          fontsize: 12,
                                          fontFamily: "JM1",
                                          fontweight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Text("demokeo");
      },
    );
  }
}

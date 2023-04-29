import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../common_screen/Comman_Container.dart';
import '../common_screen/Comman_text.dart';
import '../common_screen/variable.dart';
import 'Order_UpcominScreen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Order')
            .where("sellerid",
                isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return snapshot.data!.docs.isNotEmpty
              ? SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      print("numberofoder${snapshot.data?.docs.length}");
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Card(
                          color: Colors.grey.shade200,
                          elevation: 5,
                          child: Comman_Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 174,
                            width: double.infinity,
                            BorderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                data["image"],
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Comman_Text(
                                          text: "Qty:1",
                                          color: Colors.black,
                                          fontFamily: "JB1",
                                          fontsize: 15,
                                          fontweight: FontWeight.bold),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Comman_Text(
                                                text: "Payment :",
                                                color: Colors.black,
                                                fontFamily: "JB1",
                                                fontsize: 13,
                                                fontweight: FontWeight.bold),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Comman_Container(
                                                height: 18,
                                                width: 50,
                                                color: Colors.white,
                                                child: Center(
                                                  child: Comman_Text(
                                                    text: "Online",
                                                    color: red,
                                                    fontFamily: "JM1",
                                                  ),
                                                ),
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Comman_Text(
                                              text: "Name :",
                                              color: Colors.black,
                                              fontFamily: "JB1",
                                              fontsize: 13,
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Comman_Text(
                                              text: "${data["product_name"]}",
                                              color: grey,
                                              fontFamily: "JB1",
                                              fontsize: 13,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Comman_Text(
                                                text: "OrderId:",
                                                color: Colors.black,
                                                fontFamily: "JB1",
                                                fontsize: 13,
                                                fontweight: FontWeight.bold),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Expanded(
                                              child: Comman_Text(
                                                  text: "${data["order id"]}",
                                                  color: grey,
                                                  fontFamily: "JB1",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontsize: 13,
                                                  fontweight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Comman_Text(
                                            text: "Order_Date:",
                                            color: Colors.black,
                                            fontFamily: "JB1",
                                            fontsize: 13,
                                            fontweight: FontWeight.bold),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Comman_Container(
                                          ontap: () {
                                            setState(() {
                                              print("====> This Order Confirm");
                                              FirebaseFirestore.instance
                                                  .collection('Confirm Order')
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .set({
                                                "image": ProductImages,
                                                "product_name": ProductName
                                              });
                                            });
                                          },
                                          height: 40,
                                          width: 100,
                                          color: DarkGreen,
                                          BorderRadius:
                                              BorderRadius.circular(10),
                                          child: Center(
                                              child: Comman_Text(
                                            text: "Confirm Order",
                                            fontsize: 12,
                                            color: white,
                                            fontFamily: "JB1",
                                          )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        emptyorder,
                        height: 250,
                        width: 250,
                      ),
                    ],
                  ),
                );
        });
  }
}

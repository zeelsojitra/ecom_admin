import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Order_Upcoming_Screen extends StatefulWidget {
  const Order_Upcoming_Screen({Key? key}) : super(key: key);

  @override
  State<Order_Upcoming_Screen> createState() => _Order_Upcoming_ScreenState();
}

String? ProductName, OrderId, ProductImages;

class _Order_Upcoming_ScreenState extends State<Order_Upcoming_Screen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Column(
          //   children: [
          //     SizedBox(
          //       height: 666.sp,
          //       width: double.infinity,
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: 10,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             margin:
          //                 EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //             height: 165.sp,
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //                 color: Colors.grey.shade200,
          //                 borderRadius: BorderRadius.circular(20)),
          //             child: Padding(
          //               padding: const EdgeInsets.symmetric(
          //                   horizontal: 10, vertical: 10),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 children: [
          //                   Column(
          //                     children: [
          //                       Container(
          //                         height: 165,
          //                         width: 140,
          //                         decoration: BoxDecoration(
          //                             color: Colors.white,
          //                             borderRadius: BorderRadius.circular(10)),
          //                       ),
          //                       SizedBox(
          //                         height: 10,
          //                       ),
          //                       Text(
          //                         "Qty:1",
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontFamily: "JB1",
          //                             fontSize: 15.sp,
          //                             fontWeight: FontWeight.bold),
          //                       )
          //                     ],
          //                   ),
          //                   SizedBox(
          //                     width: 20,
          //                   ),
          //                   Column(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           Comman_Text(
          //                               text: "Payment :",
          //                               color: Colors.black,
          //                               fontFamily: "JB1",
          //                               fontSize: 15.sp,
          //                               fontWeight: FontWeight.bold),
          //                           SizedBox(
          //                             width: 10.sp,
          //                           ),
          //                           Container(
          //                             height: 18.sp,
          //                             width: 50.sp,
          //                             decoration: BoxDecoration(
          //                               color: Colors.white,
          //                               border: Border.all(
          //                                   color: Colors.grey, width: 1),
          //                             ),
          //                             child: Center(
          //                                 child: Text(
          //                               "Online",
          //                               style: TextStyle(
          //                                   color: Colors.red,
          //                                   fontFamily: "JB1"),
          //                             )),
          //                           ),
          //                         ],
          //                       ),
          //                       SizedBox(
          //                         height: 3.sp,
          //                       ),
          //                       Comman_Text(
          //                           text: "Product_Name :",
          //                           color: Colors.black,
          //                           fontFamily: "JB1",
          //                           fontSize: 15.sp,
          //                           fontWeight: FontWeight.bold),
          //                       SizedBox(
          //                         height: 5.sp,
          //                       ),
          //                       Comman_Text(
          //                           text: "Product_Price :",
          //                           color: Colors.black,
          //                           fontFamily: "JB1",
          //                           fontSize: 15.sp,
          //                           fontWeight: FontWeight.bold),
          //                       SizedBox(
          //                         height: 5.sp,
          //                       ),
          //                       Comman_Text(
          //                           text: "OrderId:",
          //                           color: Colors.black,
          //                           fontFamily: "JB1",
          //                           fontSize: 15.sp,
          //                           fontWeight: FontWeight.bold),
          //                       SizedBox(
          //                         height: 5.sp,
          //                       ),
          //                       Comman_Text(
          //                           text: "Order_Date:",
          //                           color: Colors.black,
          //                           fontFamily: "JB1",
          //                           fontSize: 15.sp,
          //                           fontWeight: FontWeight.bold),
          //                     ],
          //                   )
          //                 ],
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}

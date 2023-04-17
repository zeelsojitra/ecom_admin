
import 'package:flutter/material.dart';

import '../common_screen/Comman_Container.dart';
import '../globle/media_query.dart';

class Inner_Product extends StatefulWidget {
  const Inner_Product({Key? key}) : super(key: key);

  @override
  State<Inner_Product> createState() => _Inner_ProductState();
}

class _Inner_ProductState extends State<Inner_Product> {
  List inner_product = [
    {
      "name": "Man Shirt",
      "img": "asserts/inner_product/shirt.png",
    },
    {
      "name": "T-Shirt",
      "img": "asserts/inner_product/ti_shirt.png",
    },
    {
      "name": "Dress",
      "img": "asserts/inner_product/dress.png",
    },
    {
      "name": "Indian Wedding Dress",
      "img": "asserts/inner_product/indian_wedding.png",
    },
    {
      "name": "OnePlus Nord Buds",
      "img": "asserts/inner_product/one_pluse_birds.png",
    },
    {
      "name": "Portable Keyboard Mouse",
      "img": "asserts/inner_product/porteble_keybord_mouse.png",
    },
    {
      "name": "Wired Keyboard",
      "img": "asserts/inner_product/wired_keybord.png",
    },
    {
      "name": "Wireless Mouse",
      "img": "asserts/inner_product/wireless_mouse.png",
    },
    {
      "name": "Wired Mouse",
      "img": "asserts/inner_product/wired_mouse.png",
    },
    {
      "name": "pendrive",
      "img": "asserts/inner_product/pendrive.png",
    },
    {
      "name": "SSD Hard Disk",
      "img": "asserts/inner_product/ssd_harddrive.png",
    },
    {
      "name": "HHd Wd Hard Disk",
      "img": "asserts/inner_product/wd harddrive.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: GridView.builder(
          itemCount: inner_product.length,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Comman_Container(
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      inner_product[index]['img'],
                    ),
                  ),
                  height: height(context) * 0.3,
                  width: width(context) * 0.15,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  inner_product[index]['name'],
                  textScaleFactor: 1.5,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

const Color DarkGreen2 = Color(0xff2D6A4F);
const Color LightGreen1 = Color(0xff95d5d2);
const Color DarkGreen = Color(0xff40916C);
const Color LightGreen = Color(0xff52B788);
const Color lightGreen = Color(0xffB7E4C7);
const Color iconColor_Drawer = Color(0xffFFFFFF);
const Color iconColor = Color(0xff74C69D);
const Color orange_logo = Color(0xffF58634);
const Color green = Colors.green;
const Color purple = Colors.purple;
const Color pink = Colors.pink;
const Color deepOrange = Colors.deepOrange;
const Color teal = Colors.teal;
const Color yellow = Colors.yellow;
const Color amber = Colors.amber;
const Color grey = Colors.grey;
const Color red = Colors.red;
const Color white = Colors.white;
const Color white70 = Colors.white70;
const Color white60 = Colors.white60;
const Color black = Colors.black;
const Color black54 = Colors.black54;
const Color black87 = Colors.black87;
const Color black26 = Colors.black26;
const Color transparent = Colors.transparent;

RegExp email = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp password =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
List Catagory = [
  "chhattisgarh_dhoti_kurta",
  "chhattisgarh_paghadi",
  "chhattisgarh_saree",
  "Goa_dangar_topi",
  "Goa_kunbi_saree",
  "Goa_pano_bhaju",
  "Gujrat_bandhani",
  "Gujrat_chaniyacoli",
  "Gujrat_ghaghra",
  "Gujrat_kediyu",
  "Gujrat_patola",
  "haryana_dhoti",
  "haryana_ghaghra_choli",
  "haryana_kurta_payjama",
  // "WOMEN",
  // "Womman",
  // "Womman",
  // "Womman",
  // "Womman",
];
AppBar coomanAppBar({String? name, List<Widget>? action, bool? centerTitle}) {
  return AppBar(
    title: Text("${name}"),
    centerTitle: centerTitle,
    titleTextStyle: TextStyle(fontFamily: "JS1", fontSize: Get.height * 0.022),
    actions: action,
    backgroundColor: DarkGreen2,
  );
}

//image
const emptyorder = "asserts/image/emptyorder.png";

//logout

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  bool like_btn = false;
  RxInt selected_drawer = 0.obs;
  RxBool like_btn_details_screen = false.obs;
  RxInt onchange = 0.obs;
  RxInt selected_Screen = 0.obs;
  RxInt On_Bording_onchange = 0.obs;
  List likeList = [];
  bool isLoding = false;

  void updateLoader(bool value) {
    isLoding = value;
    update();
  }

  setLikeList(int id) {
    if (likeList.contains(id)) {
      likeList.remove(id);
    } else {
      likeList.add(id);
    }
    update();
  }
}

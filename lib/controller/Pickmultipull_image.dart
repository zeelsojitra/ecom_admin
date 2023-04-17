import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class pickmultiImage extends GetxController {
  RxInt selected = 0.obs;
  RxInt Color = 0.obs;
  RxInt size_selected = 0.obs;
  ImagePicker picker = ImagePicker();
  List<Uint8List>? imafeFileList = [];
  File? image;

  void PickImage(ImageSource imageSource) async {
    final file = await picker.pickImage(source: imageSource);

    if (file != null) {
      image = File(file.path);
      update();
    }
  }
}

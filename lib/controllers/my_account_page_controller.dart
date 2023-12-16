import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountPageController extends GetxController {

  XFile? pickedFile;
  File? imageFile;

  String imagePath = 'assets/img/blank-user-profile.png';

  GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void logout() {
    Get.deleteAll();
    Get.offAndToNamed('/login');
  }

  void openDrawer() {
    scaffoldKey1.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey1.currentState?.openEndDrawer();
  }


  // IMAGE ROUTE //

  void showAlertDialog() {
    Widget galleryButton = TextButton(
        onPressed: () {
          getImageFromGallery(ImageSource.gallery);
        },
        child: const Text('GALERIA'));

    Widget cameraButton = TextButton(
        onPressed: () {
          getImageFromGallery(ImageSource.camera);
        },
        child: const Text('CAMARA'));

    Get.defaultDialog(
      title: "Selecciona tu imagen",
      content: Row(children: [galleryButton, cameraButton],) 
    );
  }

  Future getImageFromGallery(ImageSource imageSource) async {
    pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = File(pickedFile!.path);
      imagePath = pickedFile!.path;
    } else {
      print('No selecciono ninguna imagen');
    }
    Get.back();
    update();
  }
  
}
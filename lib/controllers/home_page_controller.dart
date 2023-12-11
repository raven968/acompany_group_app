import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageController extends GetxController {
  
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  void logout() {
    Get.deleteAll();
    Get.offAndToNamed('/login');
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
}
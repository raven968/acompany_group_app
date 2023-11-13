import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool show = true;

  void changeShowPassword() {
    show = !show;
    update();
  }
}
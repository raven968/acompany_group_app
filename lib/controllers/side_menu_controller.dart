import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SideMenuController extends GetxController {

  void goToHomePage() {
    Get.toNamed("/home");
  }

  void goToProfilePage() {
    Get.toNamed('/profile');
  }

  void logout() {
    Get.deleteAll();
    Get.offAndToNamed('/login');
  }
}
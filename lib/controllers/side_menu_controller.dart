import 'package:get/get.dart';

class SideMenuController extends GetxController {

  void goToHomePage() {
    Get.deleteAll();
    Get.offAndToNamed("/home");
  }

  void goToMyAccountPage() {
    Get.deleteAll();
    Get.offAndToNamed('/my_account');
  }

  void logout() {
    Get.deleteAll();
    Get.offAndToNamed('/login');
  }
}
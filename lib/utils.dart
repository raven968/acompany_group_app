import 'package:flutter/material.dart';

class Utils {
  static const Color appSkyBlue = Color.fromARGB(255, 223, 246, 255);
  static const Color appNavyBlue = Color.fromARGB(255, 6, 40, 61);
  static const Color appSecondBlue = Color.fromARGB(255, 19, 101, 223);
  static const Color appThirdBlue = Color.fromARGB(255, 71, 181, 255);

  static MaterialStateProperty<Color> materialAppSkyBlue = MaterialStateProperty.all(appSkyBlue);
  static MaterialStateProperty<Color> materialAppNavyBlue = MaterialStateProperty.all(appNavyBlue);
}
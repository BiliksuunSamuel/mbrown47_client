import 'package:get/get.dart';

class Constants {
  static dynamic endPoint =
      Uri(host: "192.168.43.230", port: 2031, scheme: "http").toString();

  static double width = Get.context!.size!.width;
  static double height = Get.context!.size!.height;
}

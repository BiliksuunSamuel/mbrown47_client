import 'package:get/get.dart';

class navigation_get extends GetxController{
  int selectedIndex = 0;
  String activityTitle = "Streaming";

  void updateIndex(int index){
    selectedIndex = index;
    update();
  }

}
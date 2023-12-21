import 'package:get/get.dart';

class DashboardController extends GetxController{
  Rx<int> pageIndex = 0.obs;

  void updatePageIndex(int value){
    pageIndex.value = value;
  }
}
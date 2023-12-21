import 'package:get/get.dart';
import 'package:tender_app/controller/dashboard_controller.dart';

class DashboardBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
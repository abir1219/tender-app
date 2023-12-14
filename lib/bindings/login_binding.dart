import 'package:get/get.dart';
import 'package:tender_app/controller/registration_controller.dart';

import '../controller/login_controller.dart';

class LoginBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }

}
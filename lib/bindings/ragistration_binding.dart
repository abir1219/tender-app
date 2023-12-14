import 'package:get/get.dart';
import 'package:tender_app/controller/registration_controller.dart';

class RegistrationBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
  }

}
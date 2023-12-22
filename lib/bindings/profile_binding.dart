import 'package:get/get.dart';
import 'package:tender_app/controller/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}
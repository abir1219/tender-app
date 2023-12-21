import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tender_app/models/login_model.dart';
import 'package:tender_app/repository/login_repository.dart';
import 'package:tender_app/res/app_pages.dart';
import 'package:tender_app/utils/utils.dart';


class LoginController extends GetxController{
  final _loginRepo = LoginRepository();
  Rx<LoginModel> loginModel = LoginModel().obs;
  RxBool isLoading = false.obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  void validation(){
    if(emailController.value.text.isEmpty){
      Utils.flutterToast("Please enter email");
    }
    // else if(emailController.value.text.isNotEmpty && emailController.value.text.length != 10){
    //   Utils.flutterToast("Please enter a valid mobile number");
    // }
    else if(passwordController.value.text.isEmpty){
      Utils.flutterToast("Please enter password");
    }else{
      _login();
    }
  }

  Future<void> _login() async{

    Map<String,dynamic> body = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    isLoading.value = true;
    _loginRepo.login(body).then((value){
      isLoading.value = false;
      // loginModel.value = LoginModel.fromJson(value);
      Utils.flutterToast(value['message']);
      if(value['message'] == "Logged in successfully!"){
        Get.offNamed(AppPages.Dashboard);
      }
    }).onError((error, stackTrace){
      isLoading.value = false;
      Utils.flutterToast("Getting some error");
      debugPrint("LOGIN_ERROR-->$error");
    });
  }

}
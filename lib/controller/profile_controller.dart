import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tender_app/models/profile_model.dart';
import 'package:tender_app/repository/profile_repository.dart';
import 'package:tender_app/utils/sharedpreference_utils.dart';
import 'package:tender_app/utils/utils.dart';

import '../utils/app_constants.dart';

class ProfileController extends GetxController{
  final _repo = ProfileRepository();
  Rx<bool> isLoading = false.obs;

  Rx<ProfileModel> profileModel = ProfileModel().obs;
  Rx<TextEditingController> oldPassword = TextEditingController().obs;
  Rx<TextEditingController> newPassword = TextEditingController().obs;

  Future<void> getProfile() async{
    isLoading.value = true;
    _repo.getProfile().then((value) {
      isLoading.value = false;
      profileModel.value = ProfileModel.fromJson(value);
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.flutterToast("Getting some troubles");
      debugPrint("PROFILE_USER_ERROR--->$error");
    });
  }

  Future<void> changePassword(void Function(dynamic response) func) async{
    isLoading.value = true;
    Map<String,dynamic> body = {
      'user_id' : SharedPreferencesUtils.getString(AppConstants.USERID),
      'current_password': oldPassword.value.text,
      'new_password': newPassword.value.text,
    };

    _repo.changePassword(body).then((value) {
      isLoading.value = false;
      func(value);
    }).onError((error, stackTrace) {
      isLoading.value = false;
      Utils.flutterToast("Getting some troubles");
      debugPrint("CHANGE_PASSWORD_ERROR--->$error");
    });
  }
}
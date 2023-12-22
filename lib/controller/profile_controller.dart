import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tender_app/models/profile_model.dart';
import 'package:tender_app/repository/profile_repository.dart';
import 'package:tender_app/utils/utils.dart';

class ProfileController extends GetxController{
  final _repo = ProfileRepository();
  Rx<bool> isLoading = false.obs;

  Rx<ProfileModel> profileModel = ProfileModel().obs;

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
}
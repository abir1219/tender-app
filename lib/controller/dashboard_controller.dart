import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tender_app/utils/app_constants.dart';
import 'package:tender_app/utils/sharedpreference_utils.dart';
import 'package:tender_app/utils/utils.dart';

import '../models/all_tenders_model.dart';
import '../repository/dashboard_repository.dart';

class DashboardController extends GetxController{
  final _repo = DashboardRepository();
  RxBool isLoading = false.obs;
  Rx<AllTendersModel> allTendersModel = AllTendersModel().obs;

  Rx<int> pageIndex = 0.obs;

  void updatePageIndex(int value){
    pageIndex.value = value;
  }

  Future<void> getAllTenders() async{
    isLoading.value = true;
    await SharedPreferencesUtils.init();
    Map<String,dynamic> body = {
      "user_id": SharedPreferencesUtils.getString(AppConstants.USERID)
    };

    _repo.getAllTenders(body).then((value) {
      isLoading.value = false;
      debugPrint("TENDER_VALUE===>$value");
      if(value[1] == 200){
        allTendersModel.value = AllTendersModel.fromJson(value[0]);
      }
    }).onError((error, stackTrace){
      isLoading.value = false;
      Utils.flutterToast("Getting some troubles");
      debugPrint("GET_ALL_TENDERS_ERROR==>$error");
    });
  }
}
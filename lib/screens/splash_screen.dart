import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tender_app/res/app_pages.dart';
import 'package:tender_app/utils/app_constants.dart';
import 'package:tender_app/utils/sharedpreference_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initSp();
  }

  Future<void> initSp() async{
    await SharedPreferencesUtils.init();

    Future.delayed(const Duration(seconds: 2),() =>
    SharedPreferencesUtils.containsKey(AppConstants.USERID)?
    Get.offNamed(AppPages.Dashboard):
    Get.offNamed(AppPages.Login));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(
      child: Text("Splash Screen"),
    ),));
  }
}

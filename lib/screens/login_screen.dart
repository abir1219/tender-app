import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tender_app/controller/login_controller.dart';
import 'package:tender_app/res/app_pages.dart';
import 'package:tender_app/screens/registration_screen.dart';

import '../widgets/reusable_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  var controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          gradient: customContainerGradientStyle(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     Container(
                       // color:Colors.red,
                       alignment: Alignment.center,
                       child: Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                                           ),
                     ),
                    Gap(30.0.h),
                    emailInputFields("Email",controller.emailController.value),
                    Gap(20.0.h),
                    passwordInputFields("Password",controller.passwordController.value,isVisible,() {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    }),
                    Gap(20.0.h),
                    Obx(() =>  customButton('Login',() {
                        controller.validation();
                      },controller.isLoading.value),
                    )
                  ],
                ),
              ),
              customButton('Create an Account',() {
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),));
                Get.toNamed(AppPages.Registration);
              },false),
            ],
          ),
        ),
      ),
    );
  }
}

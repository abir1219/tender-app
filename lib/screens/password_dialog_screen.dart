import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tender_app/utils/utils.dart';

import '../controller/profile_controller.dart';
import '../widgets/reusable_widgets.dart';

class PasswordDialogScreen extends StatefulWidget {
  const PasswordDialogScreen({super.key});

  @override
  State<PasswordDialogScreen> createState() => _PasswordDialogScreenState();
}

class _PasswordDialogScreenState extends State<PasswordDialogScreen> {

  var controller = Get.find<ProfileController>();
  var isCurrentPasswordVisible = false;
  var isOldPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /*TextField(
            controller: controller.oldPassword.value,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Old Password',
            ),
          ),*/
          passwordInputFields('Current Password', controller.oldPassword.value, isCurrentPasswordVisible, () {
            setState(() {
              isCurrentPasswordVisible = !isCurrentPasswordVisible;
            });
          }),
          passwordInputFields('New Password', controller.newPassword.value, isCurrentPasswordVisible, () {
            setState(() {
              isCurrentPasswordVisible = !isCurrentPasswordVisible;
            });
          }),
          /*TextField(
            controller: controller.newPassword.value,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'New Password',
            ),
          ),*/
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
          onPressed: () {
            validation();
            //Navigator.of(context).pop();
          },
          child: Obx(() => controller.isLoading.value?
              Center(
                child: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: const CircularProgressIndicator(color: Colors.white,),
                ),
              )
              :const Text('Update Password')),
        ),
      ],
    );
  }

  void validation() {
    if(controller.oldPassword.value.text.isEmpty){
      Utils.flutterToast("Please enter your current password");
    }else if(controller.newPassword.value.text.isEmpty){
      Utils.flutterToast("Please enter your new password");
    }else {
      controller.changePassword((response) {
        //if(response[])
      });
    }
  }
}

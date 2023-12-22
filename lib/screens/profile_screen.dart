import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tender_app/controller/profile_controller.dart';

import '../widgets/reusable_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var controller = Get.isRegistered<ProfileController>()?Get.find<ProfileController>():
  Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller.getProfile();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Obx(() => controller.isLoading.value?
            Center(
              child: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: const CircularProgressIndicator(color: Colors.black,)),
            )
            :ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      margin: EdgeInsets.only(top: 50.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.sp),
                        //color: Colors.red
                        // image: const DecorationImage(
                        //   image: AssetImage("assets/icons/avatar_img.png"),
                        //   // image: NetworkImage("https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"),
                        //   fit: BoxFit.contain
                        // ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/icons/avatar_img.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: MediaQuery.of(context).size.width * .41,
                      child: Container(
                        margin: EdgeInsets.only(top: 40.h),
                        height: 16.h,
                        width: 16.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.sp),
                            color: Colors.greenAccent
                            ),
                      ))
                ],
              ),
              // ListTile(
              //   title: Text("First Name",style: TextStyle(fontFamily: 'Poppins',
              //       color: Colors.black,
              //   fontSize: 16.sp,fontWeight: FontWeight.bold),),
              //   subtitle: Text("Abir Chanda",style: TextStyle(fontFamily: 'Poppins',
              //       color: Colors.black,
              //       fontSize: 14.sp,fontWeight: FontWeight.normal),),
              //
              // )
              Container(
                  margin: EdgeInsets.only(
                      top: 30.h, left: 16.w, right: 16.w, bottom: 6.h),
                  child: reusableProfileField(
                      labelText: 'First Name', text: '${controller.profileModel.value.firstName}')),

              Container(
                  margin: EdgeInsets.only(
                      top: 6.h, left: 16.w, right: 16.w, bottom: 6.h),
                  child: reusableProfileField(
                      labelText: 'Last Name', text: '${controller.profileModel.value.lastName}')),

              Container(
                  margin: EdgeInsets.only(
                      top: 6.h, left: 16.w, right: 16.w, bottom: 6.h),
                  child: reusableProfileField(
                      labelText: 'Date of Birth', text: '${controller.profileModel.value.dateOfBirth}')),

              Container(
                  margin: EdgeInsets.only(
                      top: 6.h, left: 16.w, right: 16.w, bottom: 6.h),
                  child: reusableProfileField(
                      labelText: 'Phone No', text: '${controller.profileModel.value.phone}')),

              Container(
                  margin: EdgeInsets.only(
                      top: 6.h, left: 16.w, right: 16.w, bottom: 6.h),
                  child: reusableProfileField(
                      labelText: 'Email', text: '${controller.profileModel.value.email}')),

              Container(
                  margin: EdgeInsets.only(
                      top: 6.h, left: 16.w, right: 16.w, bottom: 6.h),
                  child: reusableProfileField(
                      labelText: 'District/Block',
                      text: '${controller.profileModel.value.district}, ${controller.profileModel.value.block}')),
            ],
          ),
        ),
      ),
    ));
  }
}

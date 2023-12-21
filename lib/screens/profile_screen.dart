import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.sp),
                image: const DecorationImage(
                  image: AssetImage("assets/icons/avatar_img.png"),
                  // image: NetworkImage("https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"),
                  fit: BoxFit.contain
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

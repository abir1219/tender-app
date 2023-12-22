import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Overview Dashboard",
          style: TextStyle(color: Colors.white,fontSize: 14.sp),),
        backgroundColor: const Color(0xFF1b293a),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        crossAxisSpacing: 1.sp,
        mainAxisSpacing: 3.sp,
        childAspectRatio: 1.2.sp),
        itemBuilder: (context, index) {
        return _buildReport();
      },itemCount: 4,),
    ));
  }


  Widget _buildReport(){
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child: Text("1",
                style: TextStyle(color: Colors.black,fontSize: 22.sp,fontWeight: FontWeight.bold,fontFamily: 'Poppins'),)),
              Container(
                height: 30.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: const Icon(
                  Icons.notifications_active,color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tender_app/controller/dashboard_controller.dart';
import 'package:tender_app/models/all_tenders_model.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  var controller = Get.find<DashboardController>();

  @override
  void initState() {
    super.initState();
    controller.getAllTenders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Overview Dashboard",
          style: TextStyle(color: Colors.white,fontSize: 14.sp),),
        backgroundColor: const Color(0xFF1b293a),
      ),
      body: Obx(() => controller.isLoading.value?
          SizedBox(
            height: double.maxFinite,
            child: Center(
              child: SizedBox(
                height: 24.h,
                width: 24.w,
                child: const CircularProgressIndicator(color: Colors.black,),
              ),
            ),
          )
          :
          Column(
            children: [
              _buildReport("new",controller.allTendersModel.value),
              _buildReport("active",controller.allTendersModel.value),
              _buildReport("todo",controller.allTendersModel.value),
              _buildReport("completed",controller.allTendersModel.value),
            ],
          )
      ),
    ));
  }
/*
GridView.builder(
          shrinkWrap: true,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
          crossAxisSpacing: 1.sp,
          mainAxisSpacing: 3.sp,
          childAspectRatio: 1.2
          ),
          itemBuilder: (context, index) {
          return _buildReport(controller.allTendersModel.value);
        },itemCount: controller.allTendersModel.value.active!.length
        +controller.allTendersModel.value.completed!.length+controller.allTendersModel.value.todo!.length,),

 */

  Widget _buildReport(String type,AllTendersModel model){
    Color color = Colors.white;
    IconData iconData = Icons.abc;
    String name = "";
    int count = 0;
    if(type == "new"){
      color = const Color(0xFF206BC4);
      iconData = Icons.notifications_active;
      name = "New";
      count = 0;
    }else if(type == "active"){
      color = const Color(0xFF2FB344);
      iconData = Icons.notifications_active;
      name = "Active";
      count = model.active!.length;
    }else if(type == "todo"){
      color = const Color(0xFF1DA1F2);
      iconData = Icons.notifications_active;
      name = "ToDo";
      count = model.todo!.length;
    }else if(type == "completed"){
      color = const Color(0xFF1877f2);
      iconData = Icons.notifications_active;
      name = "Completed";
      count = model.completed!.length;
    }

    return Container(
      height: MediaQuery.of(context).size.width * .2,//80.h,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(.5,0),
            spreadRadius: 1.2
          )
        ]
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * .18,//70.h,
            width: MediaQuery.of(context).size.width * .2,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.sp),
              color: color,//type == "new"?Color(0xFF206BC4), //2FB344,1DA1F2,1877f2
            ),
            child: Center(
              child: Icon(iconData,color: Colors.white,size: 28.sp,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
                Text("$count",style: TextStyle(color: Colors.grey,fontSize: 18.sp,fontWeight: FontWeight.bold,fontFamily: "Poppins"),)
              ],
            ),
          )
        ],
      )
    );
  }
}

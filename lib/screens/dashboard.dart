import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tender_app/controller/dashboard_controller.dart';
import 'package:tender_app/widgets/dashboard_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  var controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Obx(() => buildPage(controller.pageIndex.value),),
      bottomNavigationBar: Obx(() =>
        BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // backgroundColor: const Color(0xFF1b293a),
          backgroundColor: Colors.amber,
          currentIndex: controller.pageIndex.value,
          onTap: (value) {
            controller.pageIndex.value = value;
          },
          items: bottomTabs,
        ),
      ),
    ));
  }
}

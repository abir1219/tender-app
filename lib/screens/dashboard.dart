import 'package:flutter/material.dart';
import 'package:tender_app/widgets/dashboard_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        child: buildPage(1),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: bottomTabs,
      ),
    ));
  }
}

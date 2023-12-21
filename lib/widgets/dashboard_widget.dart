import 'package:flutter/material.dart';
import 'package:tender_app/screens/report_screen.dart';

Widget buildPage(int index){
  List<Widget> _pages = [
    //const Center(child: Text("Dashboard")),
    const ReportScreen(),
    const Center(child: Text("All Tender")),
    const Center(child: Text("Categorisation")),
  ];

  return _pages[index];
}

var bottomTabs = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home,color: Colors.grey,),
    activeIcon: Icon(Icons.home_outlined,color: Colors.white,),label: 'Home',),
  const BottomNavigationBarItem(icon: Icon(Icons.library_books_outlined,color: Colors.grey),
    activeIcon: Icon(Icons.library_books_outlined,color: Colors.white),
    label: 'Home',),
  const BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined,color: Colors.grey,),
    activeIcon: Icon(Icons.dashboard_outlined,color: Colors.white),
    label: 'Home',),
];
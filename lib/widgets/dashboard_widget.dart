import 'package:flutter/material.dart';

Widget buildPage(int index){
  List<Widget> _pages = [
    const Center(child: Text("Dashboard")),
    const Center(child: Text("All Tender")),
    const Center(child: Text("Categorisation")),
  ];

  return _pages[index];
}

var bottomTabs = [
  BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
  BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
  BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
];
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../../color.dart';
import '../appointments/completed_appointments.dart';
import '../appointments/my_appointments.dart';
import 'home_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
   
    Myappointments(),
     CompletedAppointments(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(), 
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Appcolor.maincolor,
        buttonBackgroundColor: Appcolor.border,
        height: 60,
        index: _selectedIndex,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.calendar_today, size: 30, color: Colors.white),
          Icon(Icons.check_circle, size: 30, color: Colors.white),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

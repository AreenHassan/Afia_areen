import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../color.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<Widget> pages;
  final Color backgroundColor;
  final Color barColor;
  final Color buttonColor;
  final List<IconData> icons;

  const CustomBottomNavigationBar({
    Key? key,
    required this.pages,
    this.backgroundColor = Colors.white,
    this.barColor = Appcolor.maincolor,
    this.buttonColor = Appcolor.border,
    required this.icons,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: widget.backgroundColor,
        color: widget.barColor,
        buttonBackgroundColor: widget.buttonColor,
        height: 60,
        index: _pageIndex,
        items: widget.icons.map((icon) => Icon(icon, size: 30, color: Colors.white)).toList(),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../color.dart';

class CustomAppbarHomepage extends StatelessWidget {
  const CustomAppbarHomepage({
    super.key,
    required this.scaffoldstate,
  });

  final GlobalKey<ScaffoldState> scaffoldstate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Appcolor.border,
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
        color: Appcolor.maincolor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(45)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.vertical_distribute_rounded,
                    color: Appcolor.whitecolor,
                  ),
                  onPressed: () {
                    scaffoldstate.currentState!.openDrawer();
                  },
                ),
                const Expanded(
                  child: Text(
                    "Afia",
                    style: TextStyle(
                      color: Appcolor.whitecolor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 65,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Afia.PNG'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

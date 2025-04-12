import 'package:flutter/material.dart';

import '../../../color.dart';

class PatientNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(color: Appcolor.whitecolor),
        ),
        centerTitle: true,
      ),
    );
  }
}

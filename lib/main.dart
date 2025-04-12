import 'package:afia2/themes.dart';
import 'package:flutter/material.dart';

import 'doctor/features/auth/pages/log_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      theme: lightThem,
      debugShowCheckedModeBanner: false,
      home: const LogInPage(),
    );
  }
}

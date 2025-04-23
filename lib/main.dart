import 'package:flutter/material.dart';
import 'login_page.dart'; // ✅ Make sure this matches your file name

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: LoginPage(), // ✅ Starting from LoginPage
    );
  }
}

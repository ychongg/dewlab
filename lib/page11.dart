import 'package:flutter/material.dart';

class Page11 extends StatelessWidget {
  const Page11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'images/마일리지_마일리지 - 9.png', // pubspec.yaml에 등록된 경로
          fit: BoxFit.contain,
          width: double.infinity,
        ),
      ),
    );
  }
}
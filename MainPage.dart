import 'package:flutter/material.dart';
import 'Page1.dart';   // Page1 import 추가

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Page1()),
            );
          },
          child: Image.asset(
            'images/home.png',
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Page9.dart';

class Page8 extends StatelessWidget {
  const Page8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Page9()),
            );
          },
          child: Image.asset(
            'images/홈화면 (대여 후).png',
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

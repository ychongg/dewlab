import 'package:flutter/material.dart';
import 'Page6.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Page6()),
            );
          },
          child: Image.asset(
            'images/모빌리티 대여-선택후 - 6.png',
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

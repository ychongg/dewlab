import 'package:flutter/material.dart';
import 'Page11.dart';

class Page10 extends StatelessWidget {
  const Page10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Page11()),
            );
          },
          child: Image.asset(
            'images/지쿠터 반납 - 8.png',
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'Page4.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Page4()),
            );
          },
          child: Image.asset(
            'images/정상이용 - 4.png',
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}

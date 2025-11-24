import 'package:flutter/material.dart';

class Rent extends StatelessWidget {
  const Rent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          'images/rent.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

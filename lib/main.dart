import 'package:flutter/material.dart';
import 'home.dart';
import 'mileage.dart';
import 'rent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Mileage(), //시작화면
    );
  }
}

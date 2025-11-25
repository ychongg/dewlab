// main.dart
import 'package:flutter/material.dart';
import 'qr_rental.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRscanscreen(),
    );
  }
}

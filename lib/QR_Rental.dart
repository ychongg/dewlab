// qr_scan_screen.dart
import 'package:flutter/material.dart';
import 'rental_screens.dart';

class QRscanscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) {
          final box = context.findRenderObject() as RenderBox;
          final tapPosition = box.globalToLocal(details.globalPosition);

          // 중앙 파란 박스 영역 판정
          if (tapPosition.dx > 60 &&
              tapPosition.dx < 360 &&
              tapPosition.dy > 250 &&
              tapPosition.dy < 550) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RentalCompleteScreen()),
            );
          }
        },
        child: Image.asset(
          'images/QR - 3.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

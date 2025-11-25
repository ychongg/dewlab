// rental_screens.dart
import 'package:flutter/material.dart';
import 'qr_rental.dart';

class RentalCompleteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/지쿠터 대여 - 7.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 100,
            left: 40,
            right: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeAfterRentalScreen()),
                );
              },
              child: Container(
                height: 50,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeAfterRentalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/홈화면 (대여 후).png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // 모빌리티 반납 버튼 위치(원하는 대로 수정 가능)
          Positioned(
            bottom: 100,
            left: 40,
            right: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRscanscreen()),
                );
              },
              child: Container(
                height: 50,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

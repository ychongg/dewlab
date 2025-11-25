// rental_screens.dart
import 'package:flutter/material.dart';
import 'qr_rental.dart';
import 'page9.dart';   // Page9 import 추가

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

          // 모빌리티 반납 버튼 (Page9으로 이동)
          Positioned(
            bottom: 100,
            left: 40,
            right: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page9()),
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

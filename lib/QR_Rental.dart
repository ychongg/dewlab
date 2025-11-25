import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QRScanScreen(),
    );
  }
}

class QRScanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) {
          final box = context.findRenderObject() as RenderBox;
          final tapPosition = box.globalToLocal(details.globalPosition);

          // 중앙 파란 박스 영역 안인지 확인
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
                  MaterialPageRoute(builder: (context) => HomeAfterRentalScreen()),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
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
          // 모빌리티 반납 버튼 위치를 정확하게 잡기
          Positioned(
            bottom: 100, // 수정된 Y 좌표 (반납 버튼의 정확한 위치)
            left: 40,
            right: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRScanScreen()),
                );
              },
              child: Container(
                height: 50, // 버튼 높이
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

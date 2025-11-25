import 'package:flutter/material.dart';
import 'qr_rental.dart'; // QRScanScreen 파일 import (파일명 맞게 수정!)

class Rent extends StatelessWidget {
  const Rent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'images/rent.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🔵 '선택' 버튼 클릭 영역 (이미지 기준으로 정확히 조정)
          Positioned(
            bottom: 55,   // 이미지 속 '선택' 버튼 위치에 맞춰 조정한 값
            left: 50,
            right: 50,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QRscanscreen()),
                );
              },
              child: Container(
                height: 55,          // 선택 버튼 높이와 비슷하게
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
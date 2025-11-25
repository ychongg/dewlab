import 'package:flutter/material.dart';

class QrScanScreen extends StatelessWidget {
  const QrScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔵 전체 배경: image2.png
          Positioned.fill(
            child: Image.asset(
              'assets/images/QR - 3.png',
              fit: BoxFit.cover,   // ← 화면 전체 배경
            ),
          ),

          // 🔵 중앙 QR 박스 (Rectangle 9.png)
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const QrNextScreen(),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/Rectangle 9.png',
                width: 250,   // 원본 비율 유지
              ),
            ),
          ),

          // 🔵 상단 뒤로가기 버튼
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QrNextScreen extends StatelessWidget {
  const QrNextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("다음 화면")),
      body: const Center(
        child: Text(
          "QR 다음 화면입니다!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MobilityFixScreen extends StatelessWidget {
  const MobilityFixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [

            // ========================
            // 🔵 🔵 🔵 상단 HEADER 영역
            // ========================
            Stack(
              children: [
                // 파란 배경
                Image.asset(
                  'assets/images/Rectangle 4200.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),

                // 뒤로가기 버튼
                Positioned(
                  top: 60,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/images/Arrow right.png',
                      width: 30,
                    ),
                  ),
                ),

                // 타이틀
                Positioned(
                  top: 65,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/모빌리티 세우기.png',
                      height: 35,
                    ),
                  ),
                ),

                // 서브 텍스트
                Positioned(
                  top: 110,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/잘못 주차된 모빌리티를 세워주세요.png',
                      height: 22,
                    ),
                  ),
                ),

                // 하단 곡선
                Positioned(
                  bottom: -5,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/Ellipse 89.png',
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // ========================
            // 🔵 🔵 중앙 내용
            // ========================
            Image.asset(
              'assets/images/무엇을 하셨나요_.png',
              height: 30,
            ),

            const SizedBox(height: 20),

            // 위치 변경 / 일으키기
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/Group 36.png',
                    width: 140,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/Group 37.png',
                    width: 140,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            Image.asset(
              'assets/images/Line 16.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 30),

            Image.asset(
              'assets/images/세우신 모빌리티를 알려주세요!.png',
              height: 26,
            ),

            const SizedBox(height: 30),

            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/지도에서 선택.png',
                width: 300,
              ),
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/qr 인식.png',
                width: 300,
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

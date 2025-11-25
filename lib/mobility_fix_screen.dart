import 'package:flutter/material.dart';
import 'package:team/qr_scan_screen.dart';

class MobilityFixScreen extends StatefulWidget {
  const MobilityFixScreen({super.key});

  @override
  State<MobilityFixScreen> createState() => _MobilityFixScreenState();
}

class _MobilityFixScreenState extends State<MobilityFixScreen> {
  bool locationMode = false; // 위치 변경 선택 여부

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 0),

            // ========================
            // 🔵 🔵 🔵 상단 HEADER 영역
            // ========================
            Stack(
              children: [
                // 파란 배경
                Container(
                  margin: const EdgeInsets.only(top: 90),
                  width: double.infinity,
                  height: 260,
                  color: const Color(0xFF3A4CA8),
                ),

                // 뒤로가기
                Positioned(
                  top: 150,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/images/Arrow right.png',
                      width: 30,
                    ),
                  ),
                ),

                // 제목
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/모빌리티 세우기.png',
                      height: 35,
                    ),
                  ),
                ),

                // 서브텍스트
                Positioned(
                  top: 200,
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
                  bottom: -400,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/Ellipse 89.png',
                    width: double.infinity,
                    height: 480,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // ========================
            // 🔵 중앙 타이틀
            // ========================
            Image.asset(
              'assets/images/무엇을 하셨나요_.png',
              height: 30,
            ),

            const SizedBox(height: 20),

            // ========================
            // 🔵 위치 변경 / 일으키기 선택 버튼
            // ========================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 위치 변경
                GestureDetector(
                  onTap: () {
                    setState(() {
                      locationMode = true;
                    });
                  },
                  child: Image.asset(
                    locationMode
                        ? 'assets/images/위치변경.png' // 활성 버튼
                        : 'assets/images/Group 36.png', // 비활성
                    width: 140,
                  ),
                ),

                const SizedBox(width: 20),

                // 일으키기
                GestureDetector(
                  onTap: () {
                    setState(() {
                      locationMode = false;
                    });
                  },
                  child: Image.asset(
                    locationMode
                        ? 'assets/images/Group 37.png'
                        : 'assets/images/Group 37.png', // 활성버전 있으면 교체
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

            // ========================
            // 🔵 지도에서 선택 버튼
            // ========================
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                locationMode
                    ? 'assets/images/지도선택 활성.png'
                    : 'assets/images/지도에서 선택.png',
                width: 300,
              ),
            ),

            const SizedBox(height: 16),

            // ========================
            // 🔵 QR 코드 인식 버튼
            // ========================
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QrScanScreen()),
                );
              },
              child: Image.asset(
                locationMode
                    ? 'assets/images/qr인식활성.png'
                    : 'assets/images/qr 인식.png',
                width: 300,
                height: 75,      // 🔥 강제로 높이를 고정
                fit: BoxFit.fill, // 🔥 이미지 크기를 꽉 채워서 늘림
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:team/QR_Rental.dart';
import '../mobility_fix_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      bottomNavigationBar: const _BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _Header(),
            const SizedBox(height: 16),
            const _MapCard(),
            const SizedBox(height: 28),
            const _ActionButtons(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

//
// ----------------- HEADER -----------------
//
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 상단 바 배경 이미지
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Rectangle 4203.png',
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          // 상단 메뉴 + 타이틀
          Positioned(
            top: 25,
            left: 18,
            child: Image.asset(
              'assets/images/menu.png',
              width: 60,
            ),
          ),
          Positioned(
            top: 22,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/images/세워듀.png',
                height: 65,
              ),
            ),
          ),

          // 배경 파란색
          Container(
            margin: const EdgeInsets.only(top: 90),
            width: double.infinity,
            height: 260,
            color: const Color(0xFF3A4CA8),
          ),

          // header_wave (곡선)
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/header_wave.png',
              height: 500,  // 필요하면 조정
              fit: BoxFit.fill,
            ),
          ),
          // 프로필 + 텍스트 (좌측 / 우측 배치)
          Positioned(
            top: 120,
            left: 22,
            right: 22,
            child: Row(
              children: [

                CircleAvatar(
                  radius: 60,
                  backgroundImage:
                  const AssetImage('assets/images/profile.png'),
                ),
                SizedBox(width: 8),

                Expanded(          // ← 남는 공간을 전부 차지
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,   // ← 우측 정렬!
                    children: [
                      Image.asset('assets/images/가나디 님.png', height: 40),
                      SizedBox(height: 6),
                      Image.asset('assets/images/사용자 정보.png', height: 60),
                      SizedBox(height: 6),
                      Image.asset('assets/images/안전한 주행되세요 !.png', height: 20),
                    ],
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}

//
// ----------------- 지도 카드 -----------------
//
class _MapCard extends StatelessWidget {
  const _MapCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 지도 박스
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFF3A4CA8)),
          ),
          child: Image.asset(
            'assets/images/map_sample.png',
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // 박스 바깥에 “지도 자세히 보기” 아이콘 배치
        Container(
          margin: const EdgeInsets.only(right: 26, top: 6),
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/images/Group 42.png',
            height: 20,
          ),
        )
      ],
    );
  }
}

//
// ----------------- 버튼 2개 -----------------
//
class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PrimaryButton(
          text: '모빌리티 세우기',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MobilityFixScreen(),
              ),
            );
          },
        ),
        const SizedBox(height: 18),
        _PrimaryButton(
          text: '모빌리티 대여',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _PrimaryButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3A4CA8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

//
// ----------------- Bottom Navigation -----------------
//
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF3A4CA8), width: 2),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavIcon('assets/images/Home.png', isActive: true),
          _NavIcon('assets/images/Pin_alt_fill.png'),
          _NavIcon('assets/images/User_fill.png'),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final String asset;
  final bool isActive;

  const _NavIcon(this.asset, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: isActive ? 50 : 50,
      color: isActive ? const Color(0xFF3A4CA8) : null,
    );
  }
}

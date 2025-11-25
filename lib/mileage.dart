import 'package:flutter/material.dart';
import 'home.dart';

class Mileage extends StatelessWidget {
  const Mileage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'images/mileage.png',
              fit: BoxFit.cover,
            ),
          ),

          // 홈으로 버튼 클릭 영역(투명 버튼)
          Positioned(
            bottom: 170,   // 버튼 위치 (필요하면 조절)
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Home2()),
                  );
                },
                child: Container(
                  width: 220,
                  height: 50,
                  color: Colors.transparent,   // 이미지 위 버튼, 눈에 안 보이게
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

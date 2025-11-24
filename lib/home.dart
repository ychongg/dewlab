import 'package:flutter/material.dart';
import 'rent.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          SizedBox.expand(
            child: Image.asset(
              'images/home.png',
              fit: BoxFit.cover,
            ),
          ),

          //'모빌리티 대여' 버튼
          Positioned(
            bottom: 110, 
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Rent()),
                  );
                },
                child: Container(
                  width: 240,  
                  height: 55,  
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

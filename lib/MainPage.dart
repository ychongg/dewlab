import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(color: Colors.black),
              Center(
                child: Image.network(
                  'https://i.postimg.cc/d0T668nW/main.png',
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
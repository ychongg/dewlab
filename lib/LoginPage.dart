// LoginPage.dart 파일 전체 내용입니다.

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'MainPage.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 🔥 구글 로그인 함수 (serverClientId 추가로 안드로이드/에뮬레이터 환경 해결)
  Future<User?> _signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn;

      // Firebase Console에서 발급받은 Web Client ID를 상수로 정의
      const String webClientId = "493215236742-ie6o42f5c6fr05b4u78fsa76bf3quknu.apps.googleusercontent.com";

      if (kIsWeb) {
        googleSignIn = GoogleSignIn(
          clientId: webClientId,
        );
      } else {
        // Android/iOS 환경: serverClientId에 Web Client ID를 지정합니다.
        googleSignIn = GoogleSignIn(
          serverClientId: webClientId,
        );
      }

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("로그인 오류: $e");
      // 사용자에게 실패 메시지를 명시적으로 보여줍니다.
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("구글 로그인 실패: $e")),
        );
      }
      return null;
    }
  }

  // 이메일/비번 로그인
  Future<void> _emailLogin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("로그인 성공: ${userCredential.user?.email ?? ''}")),
      );

      // MainPage로 이동
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Firebase 인증 실패 메시지를 더 명확하게 표시
      String message;
      if (e.code == 'user-not-found') {
        message = '사용자를 찾을 수 없습니다.';
      } else if (e.code == 'wrong-password') {
        message = '비밀번호가 일치하지 않습니다.';
      } else if (e.code == 'invalid-email') {
        message = '이메일 형식이 잘못되었습니다.';
      } else {
        message = '로그인 실패: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      // 기타 오류 (Type Cast 오류가 있었다면 여기에 잡힙니다)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("로그인 실패: 알 수 없는 오류입니다. $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final topArcHeight = screenHeight * 0.23;
    final contentTop = topArcHeight * 0.78;

    return Scaffold(
      backgroundColor: const Color(0xFF4554B2),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            // White rounded container
            Positioned(
              top: contentTop,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(130),
                    topRight: Radius.circular(130),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    _buildInput("아이디", controller: _emailController),
                    const SizedBox(height: 22),
                    _buildInput("비밀번호", obscure: true, controller: _passwordController),
                    const SizedBox(height: 32),

                    // 이메일/비번 로그인 버튼
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4554B2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _emailLogin,
                        child: const Text(
                          "로그인",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // 구글 로그인 버튼
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black26),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          final user = await _signInWithGoogle();
                          if (user != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("로그인 성공: ${user.displayName ?? user.email}")),
                            );
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MainPage()),
                              );
                            }
                          }
                          // 실패 메시지는 _signInWithGoogle 함수 내에서 처리됩니다.
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 12),
                            const Text(
                              '구글 로그인',
                              style: TextStyle(color: Colors.black87, fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("아이디 찾기", style: TextStyle(fontSize: 13)),
                        SizedBox(width: 10),
                        Text("|", style: TextStyle(fontSize: 13)),
                        SizedBox(width: 10),
                        Text("비밀번호 찾기", style: TextStyle(fontSize: 13)),
                      ],
                    ),

                    const Spacer(),

                    const Text(
                      "세워듀가 처음이신가요?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 14),

                    // 회원가입 버튼
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4554B2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpPage()),
                          );
                        },
                        child: const Text(
                          "회원가입",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    const Icon(Icons.more_horiz, color: Colors.grey),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Top arc
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: TopArcClipper(arcHeight: topArcHeight),
                child: Container(
                  height: topArcHeight,
                  width: screenWidth,
                  color: const Color(0xFF4554B2),
                ),
              ),
            ),

            // Top "로그인"
            Positioned(
              top: topArcHeight * 0.25,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  '로그인',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 입력폼 공통
  static Widget _buildInput(String label, {bool obscure = false, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 15)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black38),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscure,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}

// Arc UI
class TopArcClipper extends CustomClipper<Path> {
  final double arcHeight;
  TopArcClipper({required this.arcHeight});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, arcHeight + 2);
    path.arcToPoint(
      Offset(size.width, arcHeight + 2),
      radius: Radius.elliptical(size.width / 2, arcHeight * 1.6),
      clockwise: false,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
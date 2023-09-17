import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'get_started_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GetStartedScreen()),
      );
    });

    return const Scaffold(
      body: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 200,
          backgroundImage: AssetImage("assets/image/logo.jpg"),
        ),
      ),
    );
  }
}

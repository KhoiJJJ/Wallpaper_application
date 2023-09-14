import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/Authentication/auth_page.dart';
import 'package:flutter_application_2/Screens/main_activity.dart';
import 'package:flutter_application_2/Utils/routers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),(){
      if(auth.currentUser == null){
        nextPageOnly(context: context,page: const AuthPage());
      }else{
        nextPageOnly(context: context,page: const MainActivityPage());
      }
    });
    return const Scaffold(
      body: Center(
        child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 200,
                backgroundImage: AssetImage("assets/image/logo.jpg"),
              ),
            ),
      ),
    );
  }
}
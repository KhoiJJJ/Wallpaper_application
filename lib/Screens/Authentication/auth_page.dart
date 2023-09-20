import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/auth_provider.dart';
import 'package:flutter_application_2/Screens/Authentication/forgot_pw_page.dart';
import 'package:flutter_application_2/Screens/Authentication/signup_page.dart';
import 'package:flutter_application_2/Screens/main_activity.dart';

import '../../Widgets/custome_app_bar.dart';
import '../../Widgets/show_alert.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<UserCredential?> signIn() async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // If login is successful, navigate to MainPage
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainActivityPage()),
          (route) => false);

      return userCredential;
    } catch (e) {
      // Handle sign-in errors here
      print('Sign-In Error: $e');
      return null; // Return null to indicate an error during sign-in
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var signUpImages = ['g.png', 'f.png', 't.png'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: CustomAppBar(
          word1: "Wallpaper",
          word2: "PexelArt",
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            //appLogo
            Container(
              height: 100,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 150,
                  backgroundImage: AssetImage("assets/image/logo.jpg"),
                ),
              ),
            ),
            //welcome Text
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello Again",
                    style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Welcome back, you've been missed!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            PreferredSize(
                preferredSize: const Size.fromHeight(120.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Email',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Password',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordPage()),
                                    );
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        signIn();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                              child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                  ],
                )),

            const SizedBox(
              height: 50,
            ),

            RichText(
              text: TextSpan(
                  text: "Or Login by another mothods:",
                  style: TextStyle(color: Colors.grey[500], fontSize: 16)),
            ),
            GestureDetector(
              onTap: () {
                AuthenticationProvider().signInWithGoogle().then((value) {
                  showAlert(context, "You logged in");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainActivityPage()),
                      (route) => false);
                }).catchError((e) {
                  showAlert(context, e.toString());
                });
              },
              child: Wrap(
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                "assets/image/${signUpImages[index]}"),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                    (route) => false);
              },
              child: RichText(
                text: TextSpan(
                    text: "Not a member?",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                    children: const [
                      TextSpan(
                        text: "Register now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

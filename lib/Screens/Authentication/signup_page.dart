import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/main_activity.dart';
import '../../Widgets/custome_app_bar.dart';
import 'auth_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      addUserInfor(_emailController.text.trim(), _phoneController.text.trim());

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              MainActivityPage(), // Replace with your MainPage widget
        ),
      );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future addUserInfor(String email, String phoneNumber) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'phoneNumber': phoneNumber,
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    "Hello There",
                    style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rigister below with your details!",
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
                    //email field
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
                        controller: _phoneController,
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
                          hintText: 'Phone',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //password field
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
                    const SizedBox(
                      height: 15,
                    ),
                    //confirmed password field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        obscureText: true,
                        controller: _confirmPasswordController,
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
                          hintText: 'Confirm Password',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        signUp();
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
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        ),
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
                                builder: (context) => const AuthPage()),
                            (route) => false);
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "You're a member?",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 20),
                            children: const [
                              TextSpan(
                                text: "Login now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 20),
                              )
                            ]),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

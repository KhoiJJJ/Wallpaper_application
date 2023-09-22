import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Provider/auth_provider.dart';
import '../../Widgets/account_widget.dart';
import '../../Widgets/app_icons.dart';
import '../../Widgets/big_text.dart';
import '../Authentication/auth_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final TextEditingController _feedbackController = TextEditingController();

  void submitFeedback(String feedback) {
    // Store feedback in Firebase Firestore
    FirebaseFirestore.instance.collection('feedback').add({
      'text': feedback,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Clear the input field
    _feedbackController.clear();

    // Show a confirmation message or navigate to another screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Feedback submitted successfully!'),
      ),
    );
  }
  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          //profile
          AppIcon(
            icon: Icons.person,
            backgroundColor: const Color(0xFF89dad0),
            iconColor: Colors.white,
            iconSize: 75,
            size: 150,
          ),
          const SizedBox(
            height: 30,
          ),
          //name
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: const Color(0xFF89dad0),
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(text: "Signed in as: ${user.email!}")),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthenticationProvider().signOut().then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthPage()),
                            (route) => false);
                      });
                    },
                    child: AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.logout,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: 25,
                          size: 50,
                        ),
                        bigText: BigText(
                          text: "Logout",
                        )),
                  ),
                  TextField(
                    controller: _feedbackController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Enter your feedback...',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
  }

 
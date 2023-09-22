import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Authentication/auth_page.dart';
import 'main_activity.dart';

class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({super.key});
 
  @override
  
  Widget build(BuildContext context) {
     final auth = FirebaseAuth.instance;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/image/img_started.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).backgroundColor,
                      Theme.of(context).backgroundColor.withOpacity(0.5),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "The best free stock photos, royalty free images & videos shared by creators.",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (auth.currentUser == null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  AuthPage()
                                    ),(route)=>false);
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  MainActivityPage()
                                    ),(route)=>false);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Explore Now",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Provider/auth_provider.dart';
import '../../Widgets/account_widget.dart';
import '../../Widgets/app_icons.dart';
import '../../Widgets/big_text.dart';
import '../Authentication/auth_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          //profile
          AppIcon(
            icon: Icons.person,
            backgroundColor: Color(0xFF89dad0),
            iconColor: Colors.white,
            iconSize: 75,
            size: 150,
          ),
          SizedBox(
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
                        backgroundColor: Color(0xFF89dad0),
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(text: "Khoi")),
                  SizedBox(
                    height: 30,
                  ),
                  //phone
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(text: "0943187871")),
                  SizedBox(
                    height: 30,
                  ),
                  //mail
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(text: "ngockhoi@4423@gmail.com")),
                  SizedBox(
                    height: 30,
                  ),
                  //address
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: Colors.yellow,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text: "Fill in your address",
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  //message
                  AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: 25,
                        size: 50,
                      ),
                      bigText: BigText(
                        text: "Messages",
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {
                        AuthenticationProvider().signOut().then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthPage()),
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

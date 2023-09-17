import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/auth_provider.dart';
import 'package:flutter_application_2/Screens/Authentication/auth_page.dart';
import 'package:flutter_application_2/Screens/BottomNavPages/all_image.dart';
import 'package:flutter_application_2/Screens/BottomNavPages/download_page.dart';

import '../Widgets/custome_app_bar.dart';

class MainActivityPage extends StatefulWidget {
  const MainActivityPage({super.key});

  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage> {
  int pageIndex = 0;
  List<Map> bottomNavItems=[
    {'icon':Icons.image,'title':'All Image'},
    {'icon':Icons.home,'title':'Home'},
    {'icon':Icons.favorite,'title':'Favorites'},
  ];

  List<Widget> bottomNavPages=[
    Wallpaper(),
   
  ];
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
        actions: [
          IconButton(
            onPressed: (){
              AuthenticationProvider().signOut().then((value) {
                Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  AuthPage()
                                    ),(route)=>false);
              });
            },
             icon: const Icon(Icons.exit_to_app),color: Colors.black,)
        ],
      ),
      body: bottomNavPages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap:(value){
          setState(() {
            pageIndex=value;
          });
        } ,
        currentIndex: pageIndex,
        items: List.generate(bottomNavItems.length, (index) {
          final data = bottomNavItems[index];
          return BottomNavigationBarItem(icon: Icon(data['icon']),label: data['title']);
        }),
      ),
    );
  }
}
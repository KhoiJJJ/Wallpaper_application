import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/BottomNavPages/all_image.dart';
import 'package:flutter_application_2/Screens/BottomNavPages/person.dart';


import '../Widgets/custome_app_bar.dart';

class MainActivityPage extends StatefulWidget {
  const MainActivityPage({super.key});

  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage> {
  int pageIndex = 0;
  List<Map> bottomNavItems=[
    {'icon':Icons.home,'title':'Home'},
    {'icon':Icons.person,'title':'Profile'},
  ];

  List<Widget> bottomNavPages=[
    Wallpaper(),
    ProfilePage(),
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
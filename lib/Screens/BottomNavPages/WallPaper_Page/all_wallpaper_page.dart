
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/BottomNavPages/WallPaper_Page/add_wallpaper_page.dart';
import 'package:flutter_application_2/Utils/routers.dart';

class WallPaperHomePage extends StatefulWidget {
  const WallPaperHomePage({super.key});

  @override
  State<WallPaperHomePage> createState() => _WallPaperHomePageState();
}

class _WallPaperHomePageState extends State<WallPaperHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(
        child: Text("All Wallpaper")),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
             nextPage(context: context,page: AddWallPaperPage());
          }, label: Text('Upload')),
    );
  }
}
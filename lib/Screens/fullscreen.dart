import 'package:flutter/material.dart';
import 'package:flutter_application_2/Widgets/show_alert.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:gallery_saver/gallery_saver.dart';

class WallpaperSetter extends StatefulWidget {
  final String imageUrl;

  WallpaperSetter({required this.imageUrl});

  @override
  _WallpaperSetterState createState() => _WallpaperSetterState();
}

class _WallpaperSetterState extends State<WallpaperSetter> {
  WallpaperType wallpaperType = WallpaperType.home; // Default wallpaper type

  Future<void> setWallpaper() async {
    int location;

    switch (wallpaperType) {
      case WallpaperType.home:
        location = WallpaperManager.HOME_SCREEN;
        break;
      case WallpaperType.lock:
        location = WallpaperManager.LOCK_SCREEN;
        break;
      case WallpaperType.both:
        location = WallpaperManager.BOTH_SCREEN;
        break;
    }

    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
    final bool result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);

    if (result == 'Wallpaper set') {
      print('Wallpaper set successfully for $wallpaperType screen');
    } else {
      print('Failed to set wallpaper for $wallpaperType screen');
    }
  }

  void _showWallpaperTypeDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Select Wallpaper Type",
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_to_home_screen),
              title: const Text(
                'Home Screen',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                setState(() {
                  showAlert(context, "Please wait... Applying");
                  wallpaperType = WallpaperType.home;
                  setWallpaper();
                  
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_to_home_screen),
              title: const Text(
                'Lock Screen',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                setState(() {
                  showAlert(context, "Please wait... Applying");
                  wallpaperType = WallpaperType.lock;
                  setWallpaper();
                  
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_to_home_screen),
              title: const Text(
                'Both',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                setState(() {
                  showAlert(context, "Please wait... Applying");
                  wallpaperType = WallpaperType.both;
                  setWallpaper();
                  
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void saveImage() async {
    GallerySaver.saveImage(widget.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.center,
        children: [
          Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 10,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _showWallpaperTypeDialog();
                    },
                    child: Container(
                      width: 200,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        "Set Wallpaper",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                      onTap: () {
                        showAlert(context, "Please wait... Success");
                        saveImage();
                      },
                      child: Container(
                        width: 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download, // Replace with the desired icon
                              size: 24, // Adjust the icon size as needed
                              color: Colors
                                  .black, // Adjust the icon color as needed
                            ),
                            SizedBox(
                                width:
                                    8), // Add some spacing between the icon and text
                            Text(
                              "Download ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors
                                    .black, // Adjust the text color to match the icon
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              )),
        ],
      ),
    );
  }
}

enum WallpaperType {
  home,
  lock,
  both,
}

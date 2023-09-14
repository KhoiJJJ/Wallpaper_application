import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/add_wallpaper_provider.dart';
import 'package:flutter_application_2/Screens/spalsh_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UploadWallPaperProvider()),
      ],
      child: const MaterialApp(
    
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
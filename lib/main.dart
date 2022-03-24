import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/responsive/mobile_screen_layout.dart';
import 'package:shop_it/responsive/responsive_layout_screen.dart';
import 'package:shop_it/responsive/web_screen_layout.dart';
import 'package:shop_it/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA_HUyHOsppg8Xvort5_o2HTUTHGrCjCNw",
            appId: "1:239345136436:web:acc4b3bff7caa7f32feb61",
            messagingSenderId: "239345136436",
            projectId: "instagram-clone-acd4d",
            storageBucket: "instagram-clone-acd4d.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}

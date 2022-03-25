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
            apiKey: "AIzaSyAWu5yCA-iSB8y4BlZFFlqzeKHMR2Fhl8Y",
            appId: "1:979050087379:web:c96ad0dfed8a06c5e4a526",
            messagingSenderId: "979050087379",
            projectId: "shop-it-88d93",
            storageBucket: "shop-it-88d93.appspot.com"));
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

import 'package:flutter/material.dart';
import 'package:shop_it/screens/home_page.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopIT',
      home: HomePage(),
    );
  }
}
// for using json.decode()



import 'package:flutter/material.dart';
import 'package:shop_it/responsive/mobile_screen_layout.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopIT',
      home: HomePage(),
    );
  }
}

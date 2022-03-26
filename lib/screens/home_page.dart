import 'package:flutter/material.dart';
import 'package:shop_it/resources/auth_methods.dart';
import 'package:shop_it/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shop_it/utils/colors.dart';
import 'package:shop_it/widgets/image_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List _loadedPhotos = [];

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'One';
  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const apiUrl = 'https://fakestoreapi.com/products';

    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileSearchColor,
        centerTitle: true,
        title: const Text('Shop IT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () async {
                  await AuthMethods().signOut();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text('Log Out'),
                value: 'Log In',
              ),
            ];
          }),
        ],
      ),
      body: ImageSliderDemo(
        loadedPhotos: _loadedPhotos,
      ),
    );
  }
}

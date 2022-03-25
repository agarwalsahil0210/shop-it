import 'package:flutter/material.dart';
import 'package:shop_it/screens/login_screen.dart';
import 'package:shop_it/screens/signup_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shop_it/utils/colors.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List _loadedPhotos = [];

class _HomePageState extends State<HomePage> {
  // The list that contains information about photos

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
      ),
      body: ImageSliderDemo(),
      // body: SafeArea(
      //     child: _loadedPhotos.isEmpty
      //         ? Center(
      //             child: ElevatedButton(
      //               child: const Text('Load Photos'),
      //               onPressed: _fetchData,
      //             ),
      //           )
      //         // The ListView that displays photos
      //         : ListView.builder(
      //             itemCount: _loadedPhotos.length,
      //             itemBuilder: (BuildContext ctx, index) {
      //               return ListTile(
      //                 leading: Image.network(
      //                   _loadedPhotos[index]["image"],
      //                   width: 150,
      //                   fit: BoxFit.cover,
      //                 ),
      //                 title: Text(_loadedPhotos[index]['title']),
      //                 subtitle:
      //                     Text('Photo ID: ${_loadedPhotos[index]["id"]}'),
      //               );
      //             },
      //           ))
    );
  }
}

class ImageSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
            items: _loadedPhotos
                .map((item) => Container(
                      child: Center(
                          child: Image.network(item["image"],
                              fit: BoxFit.cover, width: 1000)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

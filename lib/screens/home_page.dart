import 'package:flutter/material.dart';
import 'package:shop_it/resources/auth_methods.dart';
import 'package:shop_it/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shop_it/utils/colors.dart';
import 'package:shop_it/widgets/image_slider.dart';

import 'product_details_page.dart';

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

  Widget _buildCategoryProduct(
      {required String image, required String category}) {
    return Flexible(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Card(
          elevation: 5,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  image,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  category,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // backgroundColor: Colors.white,
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
              PopupMenuItem(
                onTap: () {},
                child: const Text('Profile'),
                value: '',
              ),
            ];
          }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ImageSlider(
              loadedPhotos: _loadedPhotos,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Currently Trending',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryProduct(
                  image:
                      'https://i.pinimg.com/originals/bd/ef/cb/bdefcbc72735f64db17f3250b1e64245.png',
                  category: 'T shirts'),
              _buildCategoryProduct(
                  image:
                      'https://e7.pngegg.com/pngimages/528/973/png-clipart-white-pullover-hoodie-illustration-mexico-hoodie-bluza-clothing-mercadolibre-hoodie-white-sweatshirt.png',
                  category: 'Hoodies'),
              _buildCategoryProduct(
                  image:
                      'http://assets.stickpng.com/images/585680404f6ae202fedf26f0.png',
                  category: 'Jackets'),
              _buildCategoryProduct(
                  image:
                      'https://www.pngall.com/wp-content/uploads/5/Formal-Cotton-Pant-PNG-Free-Download.png',
                  category: 'Pants'),
              _buildCategoryProduct(
                  image:
                      'https://www.freepnglogos.com/uploads/shoes-png/dance-shoes-png-transparent-dance-shoes-images-5.png',
                  category: 'Shoes'),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _loadedPhotos.length,
              itemBuilder: (BuildContext context, int index) {
                // String key = _loadedPhotos[index].keys.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    child: InkWell(
                      hoverColor: Colors.grey,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                                  title: _loadedPhotos[index]['title'],
                                  price: _loadedPhotos[index]['price'],
                                  image: _loadedPhotos[index]['image'],
                                  description: _loadedPhotos[index]
                                      ['description'],
                                )));
                      },
                      child: Column(
                        children: [
                          Flexible(
                            child: Text(
                              _loadedPhotos[index]['title'],
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                              child: Image.network(
                            _loadedPhotos[index]['image'],
                            width: 200,
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(_loadedPhotos[index]['price'].toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

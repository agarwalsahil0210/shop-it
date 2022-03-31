import 'package:carousel_slider/carousel_slider.dart';
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

  Widget imageSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
        height: 200.0,
      ),
      items: [
        'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
        'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
        'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
        'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
        'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(i, fit: BoxFit.cover, height: 200);
          },
        );
      }).toList(),
    );
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
        title: const Text('Shopit'),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            imageSlider(),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.3,
            //   child: ImageSlider(
            //     loadedPhotos: _loadedPhotos,
            //   ),
            // ),
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
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _loadedPhotos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      height: 150,
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
                        child: Row(
                          children: [
                            Image.network(
                              _loadedPhotos[index]['image'],
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Column(
                                children: [
                                  Text(
                                    _loadedPhotos[index]['title'],
                                    textAlign: TextAlign.center,
                                    // softWrap: false,
                                    // maxLines: 1,
                                    // overflow: TextOverflow.fade,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Price \$'),
                                      Text(
                                          _loadedPhotos[index]['price']
                                              .toString(),
                                          // textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  String title;

  var price;
  String description;
  String image;
  ProductDetailsPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(image),
              height: 300,
            ),
            SizedBox(height: 20),
            Text(title)
          ],
        ),
      ),
    );
  }
}

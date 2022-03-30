import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                alignment: Alignment.center,
                image: NetworkImage(image),
                height: 300,
              ),
              const SizedBox(height: 20),
              Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

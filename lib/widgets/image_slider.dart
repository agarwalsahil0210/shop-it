import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List loadedPhotos;

  const ImageSlider({Key? key, required this.loadedPhotos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
        ),
        items: loadedPhotos
            .map((item) => Center(
                    child: Image.network(
                  item["image"],
                  fit: BoxFit.cover,
                  width: 1000,
                )))
            .toList(),
      ),
    );
  }
}

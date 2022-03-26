import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliderDemo extends StatelessWidget {
  final List loadedPhotos;

  const ImageSliderDemo({Key? key, required this.loadedPhotos})
      : super(key: key);
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
            items: loadedPhotos
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

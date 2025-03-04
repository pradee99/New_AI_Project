
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../config/theme.dart';

class Carousel extends StatelessWidget {
  final List<dynamic> items;
  final Function(int, CarouselPageChangedReason)? onPageChanged;

  // ignore: use_super_parameters
  const Carousel({
    Key? key,
    required this.items,
    this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items
          .map((item) => Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: primaryMain,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: typographyAltPrimary),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              item['description'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: typographyAltPrimary),
                            ),
                            SizedBox(height: 5.0),
                            Image.asset(
                              item['image_path'],
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
      options: CarouselOptions(
        height: 400,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        // autoPlay: true,
        // autoPlayInterval: const Duration(seconds: 3),
        // autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: onPageChanged,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

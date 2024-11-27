import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:news_app/values/colors.dart';

import '../models/news.dart';

class CustomCarouselSlider extends StatefulWidget {
  List<News> article;
  String category;
  CustomCarouselSlider({required this.article, required this.category});
  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int currentIndex = 0;
  double circleWidth = 10;
  double circleHeight = 10;
  double rectangleHeight = 10;
  double rectangleWidth = 35;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            autoPlayAnimationDuration: const Duration(milliseconds: 300),
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            autoPlay: true,
            enlargeFactor: 0.2,
          ),
          items: widget.article.take(5).map((news) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    news.imageUrl,
                    height: 500,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error, color: Colors.red, size: 40),
                      );
                    },
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                    child: Container(
                  margin: const EdgeInsets.only(left: 25, top: 25),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColor.blue,
                    shape: BoxShape.rectangle,
                  ),
                  child: Center(
                      child: Text(
                    widget.category[0].toUpperCase() + widget.category.substring(1),
                    style: const TextStyle(
                      color: MyColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
                )),
              ]),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Container(
                margin: const EdgeInsets.all(5),
                width: currentIndex == index ? rectangleWidth : circleWidth,
                height: currentIndex == index ? rectangleHeight : circleHeight,
                decoration: BoxDecoration(
                    shape: currentIndex == index
                        ? BoxShape.rectangle
                        : BoxShape.circle,
                    color: currentIndex == index ? MyColor.blue : MyColor.grey,
                    borderRadius: currentIndex == index
                        ? BorderRadius.circular(20)
                        : null),
              );
            }))
      ],
    );
  }
}

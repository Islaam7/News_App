import 'package:flutter/material.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

class CustomCarouselSlider extends StatefulWidget {
  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int currentIndex = 0;
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
          items: <Widget>[
            Builder(builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    'https://www.bing.com/th?id=OIP.gvPEhYi-JghvTLHLCLTi2QHaFY&w=141&h=103&c=8&rs=1&qlt=90&o=6&dpr=1.4&pid=3.1&rm=2',
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
          ),Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
          ),Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber,
            ),
          ),],
        )
      ],
    );
  }
}

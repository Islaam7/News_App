import 'package:flutter/material.dart';
import 'package:news_app/models/categories.dart';
import '../component/banner.dart';
import '../models/images.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Images images = Images();
  final Categories categories = Categories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'News',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.categories.length,
              itemBuilder: (context, index) {
                return BannerWidget(
                  src: images.images[index],
                  text: categories.categories[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

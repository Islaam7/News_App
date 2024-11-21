import 'package:flutter/material.dart';

import './category_card.dart';
import '../models/categories.dart';
import '../models/images.dart';

class CategoryList extends StatelessWidget {
  final Images images = Images();
  final Categories categories = Categories();

   CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.categoriesName.length,
        itemBuilder: (context, index) {
          return BannerWidget(
            category: categories.categoriesKey[index],
            src: images.images[index],
            text: categories.categoriesName[index],
          );
        },
      ),
    );
  }
}

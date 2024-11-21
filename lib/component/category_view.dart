import 'package:flutter/material.dart';

import 'news_list_builder.dart';

class CategoryView extends StatelessWidget{
  final String category;
  CategoryView({this.category = 'general'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(slivers: [NewsListBuilder(category: category)]),
      ),
    );
  }

}
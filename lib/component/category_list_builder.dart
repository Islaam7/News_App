import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';

import '../models/news.dart';
import 'carousel_slider.dart';

class CategoryListBuilder extends StatefulWidget {
  final String category;
  CategoryListBuilder({required this.category});

  @override
  State<CategoryListBuilder> createState() => _CategoryListBuilderState();
}

class _CategoryListBuilderState extends State<CategoryListBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomCarouselSlider(article: snapshot.data!, category: widget.category);
          } else if (snapshot.hasError) {
            return const Text('Opps, Try later');
          } else {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}

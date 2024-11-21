import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/component/news_card.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/services/news_service.dart';

class NewsListBuilder extends StatelessWidget {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NewsService(Dio()).getNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsCard(articleList: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Text('Opps, Try later');
          } else {
            return SliverToBoxAdapter(
              child: const Center(child: CircularProgressIndicator()),
            );
          }
        });
    // return isLoading ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())) : NewsCard(articleList: articleList,);
  }
}

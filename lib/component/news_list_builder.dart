import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/component/news_card.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/services/news_service.dart';

class NewsListBuilder extends StatefulWidget {
  final String category;
  NewsListBuilder({this.category = 'general'});
  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}
class _NewsListBuilderState extends State<NewsListBuilder> {
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
            return NewsCard(articleList: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Text('Opps, Try later');
          } else {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
    // return isLoading ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())) : NewsCard(articleList: articleList,);
  }
}

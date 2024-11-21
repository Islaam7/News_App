import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/component/news_card.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/services/news_service.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key});

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  bool isLoading = true;
  List<News> articleList = [];
  @override
  void initState() {
    super.initState();
    getGeneralNews();
  }
  Future<void> getGeneralNews() async {
    articleList = await NewsService(Dio()).getNews();
    isLoading = false;
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())) : NewsCard(articleList: articleList,);
  }
}

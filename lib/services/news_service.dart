  import 'dart:math';

  import 'package:dio/dio.dart';
  import 'package:news_app/models/news.dart';

  class NewsService {
    final Dio dio;
    NewsService(this.dio);
    Future<List<News>> getNews() async {
      try {
        Response response = await dio.get(
            'https://newsapi.org/v2/top-headlines?country=us&apiKey=bf2583ba30f14cbdb69d96ac0c2758c8&category=general');
        Map<String, dynamic> jsonData = response.data;
        List<dynamic> articlesJsonData = jsonData['articles'];
        List<News> articles = articlesJsonData
            .map((article) => News(
                title: article['title'] ?? 'No title',
                subTitle: article['description'] ?? 'No subtitle',
                imageUrl: article['urlToImage'] ?? ''))
            .toList();
        return articles;
      } catch (e) {
        print('Error*************: $e');
        return [];
      }
    }
  }

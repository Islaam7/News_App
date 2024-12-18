import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/services/news_service.dart';

class NewsCard extends StatelessWidget {
  final List<News> articleList;

  NewsCard({required this.articleList});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articleList.length,
            (context, index) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: articleList[index].imageUrl.isNotEmpty ? NetworkImage(articleList[index].imageUrl) : AssetImage('lib/assets/placeholder.jpeg') as ImageProvider , fit: BoxFit.cover)),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              '${articleList[index].title}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('${articleList[index].subTitle}'),
          ),
          SizedBox(height: 25)
        ],
      );
    }));
  }
}

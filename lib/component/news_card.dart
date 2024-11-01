import 'package:flutter/material.dart';
import 'package:news_app/models/news_data.dart';

class NewsCard extends StatelessWidget {
  final NewsData newsData = NewsData();

  NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: newsData.news.length,
            (context, index) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: newsData.news[index].imageUrl, fit: BoxFit.cover)),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              '${newsData.news[index].title}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('${newsData.news[index].subTitle}'),
          ),
          SizedBox(height: 25)
        ],
      );
    }));
  }
}

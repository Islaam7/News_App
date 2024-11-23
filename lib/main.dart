import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/component/custom_navi_bar.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:news_app/services/news_service.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomNaviBar(),
    );

  }
}
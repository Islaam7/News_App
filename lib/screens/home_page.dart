import 'package:flutter/material.dart';
import 'package:news_app/values/colors.dart';
import '../component/actions.dart';
import '../component/app_bar_leading.dart';
import '../component/carousel_slider.dart';
import '../component/category_list_builder.dart';
import '../component/header.dart';
import '../component/news_list_builder.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.white,
        leading: AppBarLeading(),
        actions: [
          AppBarAction()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: Header()
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 16)
            ), SliverToBoxAdapter(
              child:
              CategoryListBuilder(category: 'general')
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 50)),
            NewsListBuilder(),
          ],
        ),
      ),
    );
  }
}

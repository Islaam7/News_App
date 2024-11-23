import 'package:flutter/material.dart';

import 'package:news_app/values/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Breaking News',
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          'View all',
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ],
    );
  }
}

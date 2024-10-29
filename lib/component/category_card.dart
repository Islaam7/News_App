import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  AssetImage? src;
  String? text;

  BannerWidget({this.src, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        alignment: Alignment.center,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: src != null? DecorationImage(
              image: src!, fit: BoxFit.cover) : null
        ),
        child: Text(
          '$text',
          style: const TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CarImage extends StatelessWidget {
  final String tag;
  final String url;
  const CarImage({
    super.key, required this.tag, required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 240,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFD9D9D9)),
        child: Hero(
          tag: tag,
          child: Image.network(url)
        ),
      ),
    );
  }
}
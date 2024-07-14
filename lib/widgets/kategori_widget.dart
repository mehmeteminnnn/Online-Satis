import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Column(
        children: [
          if (imageUrl.isNotEmpty) Image.network(imageUrl),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}

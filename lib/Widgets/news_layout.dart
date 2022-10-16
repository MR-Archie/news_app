// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class NewsLayout extends StatelessWidget {
  final String? author, title,description,image,content;
 const NewsLayout(this.author,this.title,this.description,this.image,this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: Column(
        children: [
          Image.network(image!),
          Text(description!),
          const Divider(color: Colors.indigo),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }
}

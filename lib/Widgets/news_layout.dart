// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../models/news.dart';

class NewsLayout extends StatelessWidget {
  List<Article> newsList = [];
  NewsLayout(this.newsList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.all(3),
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Image.network(newsList[index].urlToImage),
              ],
            );
          }),
          itemCount: newsList.length,
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../models/news_convert.dart';
import 'package:news_app/Widgets/news_layout.dart';

class Bookmarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final ref = FirebaseDatabase.instance.reference().child('News/');

    return FirebaseAnimatedList(
        shrinkWrap: true,
        query: ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation animation, int index) {
          var news = json.encode(snapshot.value);
          var newsData = newsConvertFromJson(news).toJson();
          return NewsLayout(
              newsData['author'],
              newsData['title'],
              newsData['description'],
              newsData['image'],
              newsData['content'],
              newsData['url']);
        });
  }
}

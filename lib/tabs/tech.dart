// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import '../controllers/news_controller.dart';
import '../Widgets/news_layout.dart';
import 'package:get/get.dart';

class Tech extends StatelessWidget {
  final NewsController _controller = Get.put(NewsController());

  Future<void> _refreshNews(BuildContext context) async {
    return _controller.loadNews(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ef1191ebf36b4d10bc40e7144186eef0');
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: RefreshIndicator(
        onRefresh: (() => _refreshNews(context)),
        child: Obx(() {
        if (_controller.isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemBuilder: ((context, index) {
              return NewsLayout(
                  _controller.newsList[index].author,
                  _controller.newsList[index].title,
                  _controller.newsList[index].description,
                  _controller.newsList[index].urlToImage,
                  _controller.newsList[index].content);
            }),
            itemCount: _controller.newsList.length,
          );
        }
      }
      ))
    );
  }
}

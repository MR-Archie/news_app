// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import '../controllers/news_controller.dart';
import '../Widgets/news_layout.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final NewsController _controller = Get.put(NewsController());

  Future<void> _refreshNews(BuildContext context) async {
    return _controller.loadNews(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=ef1191ebf36b4d10bc40e7144186eef0');
  }

  @override
  Widget build(BuildContext context) {
    _controller.loadNews(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=ef1191ebf36b4d10bc40e7144186eef0');
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: RefreshIndicator(
        onRefresh: (() => _refreshNews(context)),
        child: Obx(
          () {
            if (_controller.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemBuilder: ((context, index) {
                  return (_controller.newsList[index].author != null &&
                          _controller.newsList[index].description != null &&
                          _controller.newsList[index].urlToImage != null &&
                          _controller.newsList[index].title != null &&
                          _controller.newsList[index].content != null &&
                          _controller.newsList[index].url !=null
                      ? Container(
                          height: 250,
                          margin: const EdgeInsets.all(4),
                          child: NewsLayout(
                              _controller.newsList[index].author,
                              _controller.newsList[index].title,
                              _controller.newsList[index].description,
                              _controller.newsList[index].urlToImage,
                              _controller.newsList[index].content,
                              _controller.newsList[index].url,
                              ),
                        )
                      : Container());
                }),
                itemCount: _controller.newsList.length,
              );
            }
          },
        ),
      ),
    );
  }
}

// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import '../services/remote_service.dart';
import '../models/news.dart';

class NewsController extends GetxController {
  var newsList = <Article>[].obs;
  var isLoading = true.obs;
  final String url = "";
  @override
  void onInit() {
    loadNews(url);
    super.onInit();
  }

  void loadNews(url) async {
    try {
      print((url));
      isLoading(true);
      var news = await RemoteService.fetchNews(url);

      if (news != null) {
        newsList.value = news;
      }
    } finally {
      isLoading(false);
    }
  }
}
